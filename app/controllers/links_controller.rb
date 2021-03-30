class LinksController < ApplicationController

  def index
    render 'home'
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save

      
    else
      @link.errors
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
