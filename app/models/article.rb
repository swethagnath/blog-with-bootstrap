class Article < ApplicationRecord	
	has_many :reviews
	belongs_to :category
	belongs_to :user
	has_many :comments
	extend FriendlyId
  	friendly_id :title, use: :slugged
	mount_uploader :image, ImageUploader
	validates_presence_of :title,:body,:publish_date,:category_id,:image
	validate :publish_date_cannot_be_in_the_past
	def publish_date_cannot_be_in_the_past
	  if publish_date > 1.month.from_now
	    	errors.add(:publish_date, "should not be greater than 1 month")
	    end
	end	
end
