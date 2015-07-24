class AddAmountRepaidToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :amount_owed, :integer
    add_column :scholarships, :amount_repaid, :integer
  end
end
