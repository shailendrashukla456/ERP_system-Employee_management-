class CreateLeaveRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :leave_requests do |t|
      t.references :leave_type, null: false, foreign_key: true
      t.date :from
      t.date :to
      t.boolean :approve

      t.timestamps
    end
  end
end
