class Service < ActiveRecord::Base
  has_many :links
  validates :embed_code, presence: true
  validates :icon, presence: true
  validates :name, presence: true
  #mount_uploader :icon, IconUploader

  WEB_ID = 1
end
