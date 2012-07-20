class User < ActiveRecord::Base
	has_many :reports

  attr_accessible :name
end
