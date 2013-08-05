# Comments can be posted on any Link that the User who posts the Comment
# can view. Their only content is a body of text that is formatted with
# Markdown.
class Comment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  belongs_to :link

  validates :body, presence: true

  def to_html
    markdown.render body
  end

  private
  def markdown
    @markdown ||= Redcarpet::Markdown.new Redcarpet::Render::HTML, auto_link: true
  end
end
