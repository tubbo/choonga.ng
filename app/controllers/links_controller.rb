class LinksController < ApplicationController
  respond_to :json, :html
  before_filter :find_tag
  before_filter :find_link, only: %w(show destroy vote)
  before_filter :authenticate_user!, except: %w(index latest show)

  def index
    @links = resource.where search_params

    respond_with @links
  end

  def latest
    @links = resource.latest.where search_params

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

  # PUT /links/1/up
  # PUT /links/1/down
  def vote
    votes = case params[:direction]
    when 'up' then @link.votes += 1
    when 'down' then @link.votes += 1
    else
      @link.votes
    end

    if @link.update_attributes votes: votes
      respond_with @link
    else
      render json: { errors: ['Could not vote on link.'] }, status: 401
    end
  end

  # PUT /links/1 << "link": { "votes": "-1|+1" }
  def update
    if @link.update_attributes edit_params
      respond_with @link
    else
      render json: { errors: @link.errors.full_messages }, status: 401
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
    params.permit(:id, :title, :tag, :name)
  end

  def edit_params
    return unless current_user.is_admin?
    params.require(:link).permit(:title, :url, :tag_id, :service_id)
  end

  def post_params
    params.require(:link).permit(:title, :url, :tag_name)
  end
end
