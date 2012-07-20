class Build < ActiveRecord::Base
  belongs_to :game
  belongs_to :platform
  attr_accessible :commit
end
