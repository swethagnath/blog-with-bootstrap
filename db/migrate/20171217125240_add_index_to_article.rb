class AddIndexToArticle < ActiveRecord::Migration[5.1]
  def change
  		 add_index :articles, :slug
  end
end
