class Link < ActiveRecord::Base
  belongs_to :service
  belongs_to :tag

  before_validation :set_service_to_web_when_none_are_found

  validates :title, presence: true
  validates :url, presence: true
  validates :service_id, presence: true
  validates :tag_id, presence: true

  private
  def set_service_to_web_when_none_are_found
    self.service ||= Service.web
  end
end
