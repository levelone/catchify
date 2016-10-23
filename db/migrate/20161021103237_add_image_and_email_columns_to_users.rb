class AddImageAndEmailColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :binary
    add_column :users, :email, :string
  end
end
