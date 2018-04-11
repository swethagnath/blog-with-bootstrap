class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users,:username,:string
  	add_column :users,:mobile,:string
  	add_column :users,:gender,:integer
  	add_column :users,:dob,:date
  end
end
