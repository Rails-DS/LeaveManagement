class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
        rename_column :users, :post, :is_admin
  end
end
