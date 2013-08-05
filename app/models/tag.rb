class Tag < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :links
  validates :name, presence: true
end
