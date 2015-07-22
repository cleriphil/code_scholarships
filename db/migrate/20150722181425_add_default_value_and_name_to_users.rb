class AddDefaultValueAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    change_column :users, :donor, :boolean,  :default => false
  end
end
