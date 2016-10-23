class RemoveActiveFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :active, :boolean
  end
end
