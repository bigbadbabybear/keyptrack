class Game < ActiveRecord::Base
	has_many :reports
	has_many :builds
  attr_accessible :key, :title
end
