class RemoveCol < ActiveRecord::Migration[5.1]
  def change
  	remove_column :categories,:sub_category,:string
  end
end
