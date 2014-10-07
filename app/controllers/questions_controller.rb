class QuestionsController < ApplicationController
  before_action :set_exam
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /exams/1/questions/1
  # GET /exams/1/questions/1.json
  def show
  end

  # GET /exams/1/questions/new
  # show all questions to choose from
  def new
    
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  # link a new question to the exam
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@exam, @question], notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: [@exam, @question] }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@exam, @question], notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: [@exam, @question] }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to exam_questions_url(@exam), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:exam_id])
    end
    
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:exam_id, :question_id, :question_type, :position)
    end
end
