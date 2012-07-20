class Platform < ActiveRecord::Base
	has_many :reports
	has_many :builds
  attr_accessible :os
end
