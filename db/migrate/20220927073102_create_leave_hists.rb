class CreateLeaveHists < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_hists do |t|
      t.string :leaveType
      t.text :leaveReason
      t.datetime :startDate
      t.datetime :endDate
      t.integer :noofDays
      t.integer :hrStatus, default: 0
      t.integer :tlStatus, default: 0

      t.timestamps
    end
  end
end
