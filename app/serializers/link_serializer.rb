class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url
  has_one :service
  has_one :tag
end
