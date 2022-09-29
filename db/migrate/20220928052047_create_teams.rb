class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :teamName
      t.string :teamLeader

      t.timestamps
    end
  end
end
