class RenameColumnNameComments < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments,:rating_average,:rating
  end
end
