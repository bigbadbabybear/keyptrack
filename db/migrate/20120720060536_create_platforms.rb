class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :os

      t.timestamps
    end
  end
end
