class CreateLeaveHists < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_hists do |t|
      t.string :leaveType
      t.text :leaveReason
      t.datetime :startDate
      t.datetime :endDate
      t.integer :noofDays
      t.integer :hrStatus
      t.integer :tlStatus

      t.timestamps
    end
  end
end
