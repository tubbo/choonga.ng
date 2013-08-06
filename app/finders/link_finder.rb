module LinkFinder
  def find_link
    @link = link_resource.where(id: link_id).first

    render json: error_msg, status: 404 and return unless @link.present?
  end

  protected
  def link_id
    params[:link_id] || params[:id]
  end

  def link_resource
    if @tag.present?
      @tag.links
    else
      Link
    end
  end

  def error_msg
    { errors: ['Link not found'] }
  end
end
