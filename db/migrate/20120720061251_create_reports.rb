class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user
      t.references :game
      t.references :platform
      t.string :report_number
      t.references :status
      t.references :resolution
      t.string :fix_commit
      t.string :fix_confirm

      t.timestamps
    end
    add_index :reports, :user_id
    add_index :reports, :game_id
    add_index :reports, :platform_id
    add_index :reports, :status_id
    add_index :reports, :resolution_id
  end
end
