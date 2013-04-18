class News < ActiveRecord::Base
  attr_accessible :datetime, :title, :content , :general
end