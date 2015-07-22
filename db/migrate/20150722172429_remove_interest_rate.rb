class RemoveInterestRate < ActiveRecord::Migration
  def change
    remove_column(:scholarships, :interest_rate, :integer)
  end
end
