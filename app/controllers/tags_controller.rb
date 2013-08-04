class TagsController < ApplicationController
  respond_to :json

  def show
    @tag = Tag.find params[:id]

    respond_with @tag
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ['Could not find tag'] }, status: 404
  end
end
