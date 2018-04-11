class Category < ApplicationRecord
	acts_as_tree
	 extend ActsAsTree::TreeView
	# attr_accessible :parent_id,:content,:name
	has_many :articles
	validates_presence_of :name,:description
	validates_uniqueness_of :name,:description
end
