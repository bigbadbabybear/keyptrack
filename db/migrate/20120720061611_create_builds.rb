class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references :game
      t.references :platform
      t.string :commit

      t.timestamps
    end
    add_index :builds, :game_id
    add_index :builds, :platform_id
  end
end
