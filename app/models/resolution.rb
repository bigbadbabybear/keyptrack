class Resolution < ActiveRecord::Base
	has_many :reports
  attr_accessible :resolution
end
