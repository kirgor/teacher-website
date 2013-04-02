class User < ActiveRecord::Base
  attr_accessible :password, :first_name, :last_name
end
