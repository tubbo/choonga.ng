# The Links API enables any authenticated user of choonga.ng to post
# content to the site.
#
# As with all API requests, error responses are returned in JSON using
# the following format:
#
#     { "errors": [ "a list", "of error", "messages ] }
#
# Successful responses are *usually* met with a full JSON response of
# the object you're operating on, or a collection of JSON objects that
# represent persisted values on the server. Sometimes, however, a
# redirect or simple '200' will be returned back to the user.
class LinksController < ApplicationController
  respond_to :json, :html
  before_filter :find_tag
  before_filter :find_link, only: %w(show destroy vote)
  before_filter :authenticate_user!, except: %w(index latest show)

  # Return a collection of links, filtered by search params in the GET
  # query or by the route itself if being requested as a sub-resource of
  # /tags.
  #
  # GET /links
  # GET /tags/1/links
  def index
    @links = resource.where search_params

    respond_with @links
  end

  # Return the JSON information for a single Link.
  #
  # GET /links/1
  def show
    respond_with @link
  end

  # Create a new Link on the site. Links must have a title and URL.
  #
  # POST /links << { "link": { "title": "", "url": "" } }
  def create
    @link = resource.new post_params

    if @link.save
      respond_with @link, status: 200
    else
      logger.error "Error posting link: #{@link.errors.full_messages}"
      render json: { errors: @link.errors.full_messages }, status: 406
    end
  end

  # Voting on a Link is done by sending a PUT request to the 'vote'
  # action, with the payload being the "direction" parameter. "direction"
  # must either be 'up' or 'down'. Successful responses 
  #
  # PUT /links/1/vote << { "direction": "up|down" }
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

  # Removing a link from the site is accomplished by sending a DELETE
  # request to the solo route of the resource. No payload is required,
  # and the request will be redirected to the collection route.
  #
  # DELETE /links/1
  def destroy
    with_message = if @link.destroy
      { notice: "Link removed." }
    else
      { alert: "Link could not be removed." }
    end

    redirect_to links_path, with_message
  end

  protected
  alias resource link_resource

  private
  def find_tag
    return true unless params[:tag_id].present?

    @tag = Tag.where(params[:tag_id]).first

    render json: { errors: ['Tag not found'] }, status: 404 and return \
      unless @tag.present?
  end

  def search_params
    params.permit(:id, :title, :tag, :name)
  end

  def edit_params
    return unless current_user.is_admin?
    params.require(:link).permit(:title, :url, :tag_id, :service_id)
  end

  def post_params
    params.require(:link).permit(:title, :url, :tag_id, :service_id, :user_id)
  end
end
