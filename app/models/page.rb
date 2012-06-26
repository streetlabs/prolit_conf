class Page < ActiveRecord::Base
  validates :identifier, :presence => true, :uniqueness => true
  attr_accessible :identifier, :title, :content

end
