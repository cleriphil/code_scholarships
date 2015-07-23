class DropRepaymentTablesAddRepaymentsTable < ActiveRecord::Migration
  def change
    drop_table :repayment_tables
    create_table :repayments do |t|
      t.integer :total
      t.integer :paid
      t.integer :scholarship_id
      t.integer :user_id

      t.timestamps
    end
  end
end
