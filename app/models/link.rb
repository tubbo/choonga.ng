class Link < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :service
  belongs_to :tag
  belongs_to :user

  attr_accessor :tag_name

  before_validation :find_service_from_url
  before_validation :find_tag_id_from_tag_name

  validates :title, presence: true
  validates :url, presence: true
  validates :service_id, presence: true
  validates :tag_id, presence: true
  validates :user_id, presence: true

  scope :latest, -> { order 'created_at desc' }

  def vote direction
    case direction
    when :up then self.votes += 1
    when :down then self.votes -= 1
    else
      self.votes
    end
  end

  private
  def find_service_from_url
    self.service = case url
    when /soundcloud/ then Service.where(name: 'Soundcloud').first
    when /youtube/ then Service.where(name: 'YouTube').first
    else
      Service.where(name: 'Web').first
    end
    self.service_id = self.service.id
  end

  def find_tag_id_from_tag_name
    self.tag_id ||= Tag.where(name: tag_name).first.id
  end
end
