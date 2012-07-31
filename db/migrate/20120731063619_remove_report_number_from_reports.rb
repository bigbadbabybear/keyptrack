class RemoveReportNumberFromReports < ActiveRecord::Migration
  def up
    remove_column :reports, :report_number
  end

  def down
    add_column :reports, :report_number, :string
  end
end
