class AddTimestamps < ActiveRecord::Migration
  def change
    add_column(:scholarships, :created_at, :datetime)
    add_column(:scholarships, :updated_at, :datetime)

    add_column(:donations, :created_at, :datetime)
    add_column(:donations, :updated_at, :datetime)

  end
end
