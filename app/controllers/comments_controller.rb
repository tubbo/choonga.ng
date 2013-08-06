# Comments are an integral part of any discussion site, and the Comments
# API of choonga.ng allows you to post comments on links using strictly
# JSON.
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

class CommentsController < ApplicationController
  respond_to :json, :html
  before_filter :find_link, only: %w(show create)
  before_filter :find_comment, only: %w(show update destroy)
  before_filter :authenticate_user!, except: %w(index show)

  # Collection view for Comments. Returns all comments filtered by a particular Link
  # or all comments on the site.
  #
  # GET /links/1/comments
  def index
    find_link if params[:link_id].present?
    @comments = resource.where search_params

    respond_with @comments
  end

  # Permalink to a single comment thread.
  #
  # GET /links/1/comments/1
  def show
    respond_with @comment
  end

  # Creates a new Comment on the given Link.
  #
  # POST /links/1/comments
  def create
    @comment = resource.new post_params

    if @comment.save
      respond_with [@link, @comment], notice: "Comment posted."
    else
      render json: { errors: @comment.errors.full_messages }, \
        alert: "Error posting comment."
    end
  end

  # Edit a Comment made on the site.
  #
  # PUT /links/1/comments/1
  def update
    if @comment.update_attributes edit_params
      respond_with @comment, notice: "Comment updated."
    else
      render json: { errors: @comment.errors.full_messages }, \
        alert: "Error editing comment."
    end
  end

  # Remove a Comment made on the site.
  #
  # DELETE /links/1/comments/1
  def destroy
    @link = @comment.link
    if @comment.destroy
      respond_with @link, notice: "Comment removed."
    else
      respond_with @link, alert: "Error editing comment."
    end
  end

  private
  def resource
    if @link.present?
      @link.comments
    else
      Comment
    end
  end

  def find_comment
    @comment = resource.where(id: params[:id]).first

    render json: { errors: ['Comment not found'] }, status: 404 and return \
      unless @comment.present?
  end

  def search_params
    params.permit(:user_id)
  end

  def edit_params
    return unless current_user.is_admin? || owns_comment?
    params.require(:comment).permit(:body)
  end

  def owns_comment?
    @comment.user_id == current_user.id
  end

  def post_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end
end
