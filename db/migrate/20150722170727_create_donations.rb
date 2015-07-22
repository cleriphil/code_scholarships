class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount, :default => 0
      t.integer :user_id

      t.timestamp
    end
  end
end
