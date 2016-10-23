class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.boolean :active
      t.boolean :active
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end