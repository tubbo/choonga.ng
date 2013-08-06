class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :name, :votes, :user, :tag
  has_one :service
  #has_one :tag
  #has_one :user

  def name
    object.title.parameterize
  end

  def tag_name
    object.tag.name
  end

  def votes
    object.votes || 0
  end

  def user
    object.user.name
  end

  def tag
    object.tag.name
  end
end
