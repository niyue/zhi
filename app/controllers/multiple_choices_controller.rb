class MultipleChoicesController < ApplicationController
  before_action :set_multiple_choice, only: [:show, :edit, :update, :destroy]

  # GET /multiple_choices
  # GET /multiple_choices.json
  def index
    @multiple_choices = MultipleChoice.all
  end

  # GET /multiple_choices/1
  # GET /multiple_choices/1.json
  def show
    @referring_exams = Part.exams(@multiple_choice)
  end

  # GET /multiple_choices/new
  def new
    @multiple_choice = MultipleChoice.new
  end

  # GET /multiple_choices/1/edit
  def edit
  end

  # POST /multiple_choices
  # POST /multiple_choices.json
  def create
    @multiple_choice = MultipleChoice.new(multiple_choice_params)

    respond_to do |format|
      if @multiple_choice.save
        format.html { redirect_to @multiple_choice, notice: '成功創建選擇題.' }
        format.json { render :show, status: :created, location: @multiple_choice }
      else
        format.html { render :new }
        format.json { render json: @multiple_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiple_choices/1
  # PATCH/PUT /multiple_choices/1.json
  def update
    respond_to do |format|
      if @multiple_choice.update(multiple_choice_params)
        format.html { redirect_to @multiple_choice, notice: '成功更新選擇題.' }
        format.json { render :show, status: :ok, location: @multiple_choice }
      else
        format.html { render :edit }
        format.json { render json: @multiple_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_choices/1
  # DELETE /multiple_choices/1.json
  def destroy
    respond_to do |format|
      if Part.has_dependent?(@multiple_choice)
        format.html { redirect_to multiple_choices_url, notice: '該題仍被引用無法刪除.' }
      else
        @multiple_choice.destroy
        format.html { redirect_to multiple_choices_url, notice: '成功刪除選擇題.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_choice
      @multiple_choice = MultipleChoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multiple_choice_params
      params.require(:multiple_choice).permit(:description, :answer, choices_attributes: [:id, :description, :correct, :_destroy])
    end
end
