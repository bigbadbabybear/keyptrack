class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :platform
  belongs_to :status
  belongs_to :resolution
  attr_accessible :fix_commit, :fix_confirm, :report_number
end
