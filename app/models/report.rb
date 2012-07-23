class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :platform
  belongs_to :status
  belongs_to :resolution

  attr_accessible :fix_commit, :fix_confirm, :report_number, :user_id, :game_id, :platform_id, :status_id, :resolution_id

	validates :user, :presence => true
	validates :game, :presence => true
	validates :platform, :presence => true
	validates :report_number, :presence => true

end
