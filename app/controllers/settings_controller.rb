require 'fileutils'

class SettingsController < ApplicationController
  def show
    create_cover_dir_if_necessary
    
    @cover = File.exist?(cover_file) ? File.read(cover_file) : ''  
  end
  
  def edit
    create_cover_dir_if_necessary
    
    @cover = File.exist?(cover_file) ? File.read(cover_file) : ''
  end
  
  def update
    create_cover_dir_if_necessary
    
    cover = params[:cover]
    File.open(cover_file, 'w') { |f| f.write(cover) } unless Rails.env.test?
      
    respond_to do |format|
      @cover = cover
      format.html { redirect_to setting_path(:cover), notice: '成功更新試卷首頁.' }
    end
  end
  
  private
  def create_cover_dir_if_necessary
    unless File.exist?(cover_dir)
      logger.info({ type: 'create_cover_directory' })
      FileUtils::mkdir_p cover_dir
    end
  end
  
  def cover_dir
    File.join(Rails.root, 'public', 'files')
  end
  
  def cover_file
    File.join(cover_dir, 'cover.pdf.erb')
  end
end
