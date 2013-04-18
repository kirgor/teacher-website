class Message < ActiveRecord::Base
  attr_accessible :author, :content, :datetime
end