class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    
    @multiple_choices = @exam.multiple_choices
    @essays = @exam.essays
    template = params[:answer] == 'true' ? 'show_with_answer' : 'show'
    respond_to do |format|
      format.html do
        render template, layout: false
      end
      format.pdf do
        
        apply_absolute_image_url
        
        @custom_cover_file = File.join(Rails.root, 'public', 'files', 'cover.pdf.erb')
        @use_custom_cover_file = File.exists?(@custom_cover_file)
        
        render pdf: @exam.name, 
          show_as_html: params[:html].present?,
          margin: { top: 30, bottom: 0 },
          header: { html: { template: 'printable_exams/page_header.pdf.erb' }, spacing: 8 }
      end
    end
  end
  
  private
  def set_exam
    @exam = Exam.find(params[:id])
  end
  
  def apply_absolute_image_url
    ckeditor_path = Rails.root.join('public', 'ckeditor_assets').to_s
    @multiple_choices.each do |mc|
      mc.description.gsub!(/\/ckeditor_assets/, ckeditor_path)
    end
    
    @essays.each do |e|
      e.description.gsub!(/\/ckeditor_assets/, ckeditor_path)
    end
  end
  
end
