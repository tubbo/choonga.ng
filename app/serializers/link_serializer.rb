class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :name
  has_one :service
  has_one :tag

  def name
    title.parameterize
  end
end
