class AddColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :categories,:sub_category,:string
  end
end
