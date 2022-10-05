class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_tl, :boolean
  end
end
