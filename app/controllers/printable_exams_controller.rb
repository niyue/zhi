class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    render layout: false
  end
  
  private
  def set_exam
    @exam = Exam.find(params[:id])
  end
  
end
