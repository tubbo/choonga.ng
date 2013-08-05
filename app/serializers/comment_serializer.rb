class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :html
  has_one :user
  has_one :link

  def html
    object.to_html
  end
end
