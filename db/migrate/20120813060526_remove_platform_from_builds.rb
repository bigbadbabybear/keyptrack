class RemovePlatformFromBuilds < ActiveRecord::Migration
  def up
    remove_column :builds, :platform_id
  end

  def down
    add_column :builds, :platform_id, :integer
  end
end
