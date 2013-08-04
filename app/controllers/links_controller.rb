class LinksController < ApplicationController
  respond_to :json
  before_filter :find_tag
  before_filter :find_link, only: %w(show destroy upvote downvote)

  def index
    @links = resource.where search_params

    respond_with @links
  end

  def show
    respond_with @link
  end

  # POST /links << "link" { "title": "A title", "url": "A url", "tag_name": "#tagname" }
  def create
    @link = resource.new post_params

    if @link.save
      respond_with @link, status: 200
    else
      logger.error "Error posting link: #{@link.errors.full_messages}"
      render json: { errors: @link.errors.full_messages }, status: 406
    end
  end

  # PUT /links/1 << "link": { "vote": "-1|+1" }
  def update
    votes = case vote_difference
    when '-1' then @link.votes - 1
    when '+1' then @link.votes + 1
    else
      @link.votes
    end

    if @link.update_attributes votes: votes
      respond_with @link
    else
      render json: { errors: ['Vote did not save on link.'] }, status: 401
    end
  end

  def destroy
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

  def find_tag
    return true unless params[:tag_id].present?

    @tag = Tag.where(params[:tag_id]).first

    render json: { errors: ['Tag not found'] }, status: 404 and return \
      unless @tag.present?
  end

  def find_link
    @link = resource.where(id: params[:id]).first

    render json: { errors: ['Link not found'] }, status: 404 and return \
      unless @link.present?
  end

  def search_params
    params.permit(:title, :tag)
  end

  def post_params
    params.require(:link).permit(:title, :url, :tag_name)
  end

  def vote_difference
    params.requrie(:link).permit(:votes)
  end
end
