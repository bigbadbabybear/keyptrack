class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :platform
  belongs_to :status
  belongs_to :resolution

	before_create :set_to_open_unresolved

  attr_accessible :fix_commit, :fix_confirm, :report_key, :user_id, :game_id, :platform_id, :status_id, :resolution_id

	validates :report_key, :presence => true

	# when a bug report is created Status/Resolution should be Open/Unresolved
	def set_to_open_unresolved
		status = Status.select("id").where("status like 'Open'").first
		resolution = Resolution.select("id").where("resolution like 'Unresolved'").first
		self.status_id = status.id
		self.resolution_id = resolution.id
	end

	def created_when?
		date_diff = Date.today - self.created_at.to_date
		case date_diff 
			when 0
				"Today"
    	when 1
				"Yesterday"
			when 2..6
				"#{date_diff.to_i.to_s} days ago" 
    end
	end
end
