class Album < ActiveRecord::Base
  attr_accessible :datetime, :title
  has_many :photos
end
