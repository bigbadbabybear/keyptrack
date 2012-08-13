class Build < ActiveRecord::Base
  belongs_to :game
  attr_accessible :commit, :type, :game_id

	validates :commit, :presence => true
	validates :game, :presence => true
end
