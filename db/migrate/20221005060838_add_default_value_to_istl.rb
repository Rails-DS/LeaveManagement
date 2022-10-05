class AddDefaultValueToIstl < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :is_tl, false
  end
end
