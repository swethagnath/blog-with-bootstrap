class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :article_id
      t.float :rating
      t.timestamps
    end
  end
end
