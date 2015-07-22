class AddTitleToScholarships < ActiveRecord::Migration
  def change
    add_column(:scholarships, :title, :string)
  end
end
