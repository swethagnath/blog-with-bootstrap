class Comment < ApplicationRecord
	ratyrate_rateable 'rating'
	belongs_to :user
	belongs_to :article
	validates_presence_of :body,:article_id,:user_id,:rating
	validates_numericality_of :article_id,:user_id
end
