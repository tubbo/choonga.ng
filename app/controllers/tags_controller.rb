# The Tags Read-Only API has been exposed in order to verify tag
# eligibility, as a catch for people who may be entering the wrong tag
# information into a form. However, since tags can not be edited by the
# userbase, all you can do is request if a tag exists right now.
class TagsController < ApplicationController
  respond_to :json

  # Returns information about a specific tag, like its name, how many
  # links are being tagged, etc. Right now, it just shows the name
  # because there is no other data to support.
  #
  # GET /tags/1
  def show
    @tag = Tag.find params[:id]

    respond_with @tag
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ['Could not find tag'] }, status: 404
  end
end
