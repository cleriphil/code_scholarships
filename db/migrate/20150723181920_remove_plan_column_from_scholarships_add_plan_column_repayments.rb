class RemovePlanColumnFromScholarshipsAddPlanColumnRepayments < ActiveRecord::Migration
  def change
    remove_column :scholarships, :plan
    add_column :repayments, :plan, :string
  end
end
