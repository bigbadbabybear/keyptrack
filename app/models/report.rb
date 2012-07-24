class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :platform
  belongs_to :status
  belongs_to :resolution

	before_save :open_unresolved

  attr_accessible :fix_commit, :fix_confirm, :report_number, :user_id, :game_id, :platform_id, :status_id, :resolution_id

	validates :user, :presence => true
	validates :game, :presence => true
	validates :platform, :presence => true
	validates :report_number, :presence => true

	# when a bug report is created Status/Resolution should be Open/Unresolved
	def open_unresolved
		#status = Status.select("id").where("status like 'Open'").first
		#resolution = Resolution.select("id").where("resolution like 'Unresolved'").first
		self.status_id = 1
		self.resolution_id = 6
	end
end
