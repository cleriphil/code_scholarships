class RemoveTypeFromScholarships < ActiveRecord::Migration
  def change
    rename_column(:scholarships, :type, :study_type)
  end
end
