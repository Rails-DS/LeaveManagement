class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.string :leaveName
      t.text :leaveDesc

      t.timestamps
    end
  end
end
