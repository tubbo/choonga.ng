class CommentsController < ApplicationController
  respond_to :json
  before_filter :find_comment, only: %w(show update destroy)

  def index
    @comments = resource.where search_params

    respond_with @comments
  end

  def show
    respond_with @comment
  end

  def create
    @comment = resource.new post_params

    if @comment.save
      respond_with @comment, notice: "Comment posted."
    else
      render json: { errors: @comment.errors.full_messages }, \
        alert: "Error posting comment."
    end
  end

  def update
    if @comment.update_attributes edit_params
      respond_with @comment, notice: "Comment updated."
    else
      render json: { errors: @comment.errors.full_messages }, \
        alert: "Error editing comment."
    end
  end

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
