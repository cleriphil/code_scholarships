class AddRepaymentPlanToScholarship < ActiveRecord::Migration
  def change
    add_column(:scholarships, :plan, :string)
  end
end
