class CommentsController < ApplicationController
	load_and_authorize_resource 
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			respond_to do |format|
				format.js
				### slug => article_id=> article
				# redirect_to article_path(@comment.article),notice:"thankyou for creating a comment"
			end
		else
			respond_to do |format|
				format.js
			end
		end
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.js
		end
	end
	def edit
		@comment = Comment.find(params[:id])
	end
	def update
		@comment = Comment.find(params[:id])
		@comment.update_attributes(comment_params)
		respond_to do |format|
			format.json
		end
	end
	private
	def comment_params
		params[:comment].permit(:body,:article_id,:user_id,:rating)
	end
end
