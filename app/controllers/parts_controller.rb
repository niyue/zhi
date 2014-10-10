class PartsController < ApplicationController
  before_action :set_exam
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.where({exam_id: @exam})
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /exams/1/parts/new
  def new
    @all_multiple_choices = MultipleChoice.all
    @all_essays = Essay.all
    @multiple_choices = @exam.multiple_choices
    @essays = @exam.essays
    @parts = part_code_map(@exam.parts)
    logger.debug({
      type: 'new_part_for_exam',
      exam_id: @exam.id,
      parts: @parts.length
    })
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)
    @part.exam = @exam
    @part.position = @exam.last_part_position(part_params['question_type']) + 1

    respond_to do |format|
      if @part.save
        logger.debug({ 
          type: 'exam_part_created',
          exam_id: @exam.id,
          part_id: @part.id
        })
        format.html { redirect_to [@exam, @part], notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
        format.js {
          @multiple_choices = @exam.multiple_choices
          @essays = @exam.essays  
          @parts = part_code_map(@exam.parts)
        }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to [@exam, @part], notice: 'Part was successfully updated.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @question = @part.question
    @part.destroy
    respond_to do |format|
      format.html { redirect_to exam_parts_url(@exam), notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
      format.js {
        @multiple_choices = @exam.multiple_choices
        @essays = @exam.essays  
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:exam_id])
    end
    
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:exam_id, :question_id, :question_type, :position)
    end
    
    def part_code_map(parts)
      parts.reduce({}) do |map, p|
        map[p.code] = p
        map
      end
    end
end
