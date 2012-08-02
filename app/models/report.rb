class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :platform
  belongs_to :status
  belongs_to :resolution

  attr_accessible :fix_commit, :fix_confirm, :report_key, :user_id, :game_id, :platform_id, :status_id, :resolution_id

  validates :user_id, :presence => true
  validates :platform_id, :presence => true
  validates :report_key, :presence => true
  validates_uniqueness_of :report_key, :allow_nil => false, :allow_blank => false
	validates_format_of :report_key, :with => /\w+\-\d+/, :on => :create

  after_validation :set_to_open_unresolved

	#
  # when a bug report is created Status/Resolution should be Open/Unresolved
  #
  def set_to_open_unresolved
    status = Status.select("id").where("status like 'Open'").first
    resolution = Resolution.select("id").where("resolution like 'Unresolved'").first
    self.status_id = status.id
    self.resolution_id = resolution.id
  end

	#
	# accepts a string given the format GAME-#### and parses it
	#
  def get_game_id(str)
  	# parse str to get GAME
    title = str.split("-")[0]
    # find id of GAME
    game = Game.select("id").where("key LIKE \'#{title.upcase}\'").to_a[0]
    self.game_id = game.id
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
