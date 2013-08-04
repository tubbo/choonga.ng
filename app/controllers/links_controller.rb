class LinksController < ApplicationController
  respond_to :json

  def index
    @links = resource.where search_params

    respond_with @links
  end

  def show
    @link = resource.find params[:id]

    respond_with @link
  end

  def create
    @link = resource.new post_params

    if @link.save
      respond_with @link, notice: 'New link posted.'
    else
      render json: { errors: @link.errors.full_messages }
    end
  end

  def destroy
    @link = resource.find params[:id]
    with_message = if @link.destroy
      { notice: "Link removed." }
    else
      { alert: "Link could not be removed." }
    end

    redirect_to links_path, with_message
  end

  private
  def resource
    if @tag.present?
      @tag.links
    else
      Link
    end
  end

  def search_params
    params.permit(:title, :tag)
  end

  def post_params
    params.require(:link).permit(:title, :url, :tag_id, :service_id)
  end
end
