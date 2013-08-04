class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :name, :votes
  has_one :service
  has_one :tag
  has_one :user

  def name
    object.title.parameterize
  end

  def tag_name
    object.tag.name
  end

  def votes
    object.votes || 0
  end
end
