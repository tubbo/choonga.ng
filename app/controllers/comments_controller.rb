class CommentsController < ApplicationController
  respond_to :json, :html
  before_filter :find_comment, only: %w(show update destroy)

  # Collection view for Comments. Returns all comments filtered by a particular Link
  # or all comments on the site.
  #
  # GET /links/1/comments
  def index
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
      respond_with @comment, notice: "Comment posted."
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
