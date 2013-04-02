class News < ActiveRecord::Base
  attr_accessible :datetime, :title, :content
end