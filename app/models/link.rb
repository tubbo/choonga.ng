# Links are the main content objects of the site. They include a title
# and URL, and they can be attached to both a Service and a Tag which
# help to organize and preview the media they link to. The Service
# association will give it an icon and allow it to be previewed inline.
#
# Links must be created by a User, and can be voted upon with the vote()
# method. They also must include a title and url property, or else they
# will not be considered valid.
class Link < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :service
  belongs_to :tag
  belongs_to :user

  has_many :comments

  attr_accessor :tag_name

  #before_validation :find_service_from_url
  #before_validation :find_tag_id_from_tag_name
  before_validation :set_votes_to_zero

  validates :title, presence: true
  validates :url, presence: true
  #validates :service_id, presence: true
  #validates :tag_id, presence: true
  #validates :user_id, presence: true

  scope :latest, -> { order 'created_at desc' }

  private
  def find_service_from_url
    unless service_id.present?
      self.service = case url
      when /soundcloud/ then Service.where(name: 'soundcloud').first
      when /youtube/ then Service.where(name: 'youtube').first
      else
        Service.where(name: 'web').first
      end

      self.service_id = self.service.id
    end
  end

  def find_tag_id_from_tag_name
    self.tag_id ||= Tag.where(name: tag_name).first.id
  end

  def set_votes_to_zero
    self.votes ||= 0
  end
end
