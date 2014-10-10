class OrdersController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  
  def show
    @multiple_choices = @exam.multiple_choices;
    @essays = @exam.essays;
  end
  
  def update
    logger.debug(params)
    question_type = params['question_type']
    question_id = params['question_id'].to_i
    from = params['from'].to_i
    to = params['to'].to_i
    respond_to do |format|
      @exam.reorder(question_type, question_id, from, to)
      format.json { render :show, status: :ok, location: exam_orders_path }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:exam_id])
    end
end
