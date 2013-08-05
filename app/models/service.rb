class Service < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :links
  validates :embed_code, presence: true
  validates :icon, presence: true
  validates :name, presence: true
  mount_uploader :icon, IconUploader
end
