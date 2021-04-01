class LinksController < ApplicationController

  def index
    render 'home'
  end

  def show
    link = Link.find_by_hashid(params[:hashid])
    link.track(request)
    redirect_to link.url
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:alert] = "The shortened URL is #{request.host}/#{@link.hashid}"
    else
      @link.errors
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :short_url)
    end
end
