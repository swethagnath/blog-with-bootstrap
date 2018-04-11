class RenameColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments,:rating,:rating_average
  end
end
