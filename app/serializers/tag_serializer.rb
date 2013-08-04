class TagSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.name.parameterize
  end
end
