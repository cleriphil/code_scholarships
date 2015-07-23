class CreateRepaymentTable < ActiveRecord::Migration
  def change
    create_table :repayment_tables do |t|
      t.integer :user_id
      t.string :plan
      t.string :scholarship_id
      
      t.timestamp
    end
  end
end
