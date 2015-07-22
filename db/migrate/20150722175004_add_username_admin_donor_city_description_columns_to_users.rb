class AddUsernameAdminDonorCityDescriptionColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :donor, :boolean
    add_column :users, :city, :string
    add_column :users, :description, :string
  end
end
