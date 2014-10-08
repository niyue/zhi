class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    @multiple_choices = @exam.multiple_choices;
    @essays = @exam.essays;
    template = params[:answer] == 'true' ? 'show_with_answer' : 'show'
    render template, layout: false
  end
  
  private
  def set_exam
    @exam = Exam.find(params[:id])
  end
  
end
