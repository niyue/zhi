class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]

  # GET /essays
  # GET /essays.json
  def index
    if params['tags']
      tag_list = params['tags'].split(',')
      logger.debug({type: 'list_tagged_essays', tags: tag_list})
      @essays = Essay.tagged_with(tag_list).includes(:tags)
    else
      @essays = Essay.all.includes(:tags)
    end
  end

  # GET /essays/1
  # GET /essays/1.json
  def show
    @referring_exams = Part.exams(@essay)
  end

  # GET /essays/new
  def new
    @essay = Essay.new
  end

  # GET /essays/1/edit
  def edit
  end

  # POST /essays
  # POST /essays.json
  def create
    @essay = Essay.new(essay_params)

    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: '成功創建問答題.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1
  # PATCH/PUT /essays/1.json
  def update
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to @essay, notice: '成功更新問答題.' }
        format.json { render :show, status: :ok, location: @essay }
      else
        format.html { render :edit }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    respond_to do |format|
      if Part.has_dependent?(@essay)
        format.html { redirect_to essays_url, notice: '該題仍被引用無法刪除.' }
      else
        @essay.destroy
        format.html { redirect_to essays_url, notice: '成功刪除問答題.' }
        format.json { head :no_content }
      end
    end
  end
  
  def tag_cloud
    @tags = Essay.tag_counts_on(:tags)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
      @essay = Essay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def essay_params
      params.require(:essay).permit(:name, :description, :answer, {:tag_list => []})
    end
end
