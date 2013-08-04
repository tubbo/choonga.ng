class Link < ActiveRecord::Base
  belongs_to :service
  belongs_to :tag
  attr_accessible :title, :url
end
