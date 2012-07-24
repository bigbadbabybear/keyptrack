class Build < ActiveRecord::Base
  belongs_to :game
  belongs_to :platform
  attr_accessible :commit, :game_id, :platform_id

	validates :commit, :presence => true
	validates :game, :presence => true
	validates :platform, :presence => true 
end
