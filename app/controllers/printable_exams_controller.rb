class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    @multiple_choices = @exam.multiple_choices;
    @essays = @exam.essays;
    render layout: false
  end
  
  private
  def set_exam
    @exam = Exam.find(params[:id])
  end
  
end
