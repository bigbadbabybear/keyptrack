class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :resolution

      t.timestamps
    end
  end
end
