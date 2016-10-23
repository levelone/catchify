class AddIndexToLocations < ActiveRecord::Migration
  def change
    add_index :locations, [:user_id, :latitude, :longitude], unique: true
  end
end
