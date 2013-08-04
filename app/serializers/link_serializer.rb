class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :name
  has_one :service
  has_one :tag

  def name
    object.title.parameterize
  end

  def tag_name
    object.tag.name
  end
end
