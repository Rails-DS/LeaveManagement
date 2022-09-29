class ChangePostToBeBooleanInUsers < ActiveRecord::Migration[7.0]
  def change
       change_column :users, :post, :boolean
  end
end
