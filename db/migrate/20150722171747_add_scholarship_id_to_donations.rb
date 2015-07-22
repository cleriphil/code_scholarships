class AddScholarshipIdToDonations < ActiveRecord::Migration
  def change
    add_column(:donations, :scholarship_id, :integer)
  end
end
