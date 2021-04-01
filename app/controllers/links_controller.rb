class LinksController < ApplicationController
  def show
    link = Link.find_by_hashid(params[:hashid])
    if link.nil?
      redirect_to root_path
    else
      link.track(request)
      redirect_to link.url
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_back(fallback_location: @link)
      flash[:alert] = "http://#{request.host}/#{@link.hashid}"
    else
      @link.errors
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :short_url)
  end
end
