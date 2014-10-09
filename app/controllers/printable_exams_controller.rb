class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    @multiple_choices = @exam.multiple_choices;
    @essays = @exam.essays;
    template = params[:answer] == 'true' ? 'show_with_answer' : 'show'
    respond_to do |format|
      format.html do
        render template, layout: false
      end
      format.pdf do
        render pdf: @exam.name, 
        margin: { top: 30, bottom: 0 },
        header: { html: { template: 'printable_exams/page_header.pdf.erb' }, spacing: 8 }
      end
    end
  end
  
  private
  def set_exam
    @exam = Exam.find(params[:id])
  end
  
end
