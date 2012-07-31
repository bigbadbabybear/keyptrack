class AddReportKeyToReports < ActiveRecord::Migration
  def change
    add_column :reports, :report_key, :string
  end
end
