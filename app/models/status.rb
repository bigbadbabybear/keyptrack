class Status < ActiveRecord::Base
	has_many :reports
  attr_accessible :status
end
