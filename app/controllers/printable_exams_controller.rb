class PrintableExamsController < ApplicationController
  before_action :set_exam, only: [:show]
  
  def show
    
    @multiple_choices = @exam.multiple_choices
    @essays = @exam.essays
    template = params[:answer] == 'true' ? 'show_with_answer' : 'show'
    @compact = params[:compact] == 'true'
    respond_to do |format|
      format.html do
        render template, layout: false
      end
      format.pdf do
        
        apply_absolute_image_url
        
        @custom_cover_file = File.join(Rails.root, 'public', 'files', 'cover.pdf.erb')
        @use_custom_cover_file = File.exists?(@custom_cover_file)
        
        paper_size = params[:paper_size] || 'a4'
        margin_top = params[:margin_top] || 30
        margin_bottom = params[:margin_bottom] || 20
        margin_left = params[:margin_left]
        margin_right = params[:margin_right]
        
        render pdf: @exam.name, 
          show_as_html: params[:html].present?,
          page_size: paper_size,
          margin: { top: margin_top, bottom: margin_bottom, left: margin_left, right: margin_right },
          header: { html: { template: 'printable_exams/page_header.pdf.erb' }, spacing: 8 },
          footer: { html: { template: 'printable_exams/page_footer.pdf.erb' } },
          dpi: 1200
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
