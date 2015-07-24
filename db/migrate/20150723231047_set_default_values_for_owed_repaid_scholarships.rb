class SetDefaultValuesForOwedRepaidScholarships < ActiveRecord::Migration
  def change
    change_column :scholarships, :amount_owed, :integer, :default => 0
    change_column :scholarships, :amount_repaid, :integer, :default => 0
  end
end
