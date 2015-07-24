class ChangeRepaymentsAndScholarshipsTables < ActiveRecord::Migration
  def change
    add_column :scholarships, :plan, :string
    add_column :repayments, :amount, :integer
    remove_column :repayments, :plan

    remove_column :repayments, :total
    remove_column :repayments, :paid

  end
end
