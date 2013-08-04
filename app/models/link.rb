class Link < ActiveRecord::Base
  belongs_to :service
  belongs_to :tag
  validates :title, presence: true
  validates :url, presence: true
end
