class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
  
  def index
    if params['q']
      @tags = Tag.starts_with(params['q'])
    else
      @tags = Tag.all
    end
    respond_to do |format|
      format.json {}
    end
  end
  
  def show
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end
end
