class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.integer :amount_requested, :default => 0
      t.integer :amount_fulfilled, :default => 0
      t.integer :interest_rate, :default => 0
      t.string :description
      t.string :type
      t.integer :user_id

      t.timestamp

    end
  end
end
