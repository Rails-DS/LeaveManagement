class AddUserReferenceToLeaveHist < ActiveRecord::Migration[7.0]
  def change
    add_reference :leave_hists, :user, null: false, foreign_key: true
  end
end
