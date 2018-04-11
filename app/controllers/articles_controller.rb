class ArticlesController < ApplicationController  
	before_action :authenticate_user!,except:[:index,:show]
	load_and_authorize_resource :find_by => :slug	
	def index
		@articles = Article.all
		@categories = Category.all
		@article = Article.new
		@category = Category.new
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
		@article.user_id = current_user.id
		if @article.save				
			respond_to do |format|
				format.js
			end
		end
	end
	def show
		 @article = Article.friendly.find(params[:id])
		 @comment = Comment.new
		 @categories = Category.all
	end
	def edit
		@article = Article.friendly.find(params[:id])
	end
	def update
		@article = Article.friendly.find(params[:id])
		if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
		if @article.update_attributes(article_params)
			redirect_to article_path(@article), notice:"Successfully updated!!!!!!!"
		else
			render action: 'edit'
		end
	end
	def destroy
		 @article = Article.friendly.find(params[:id])
		 if @article.destroy
		 	respond_to do |format|
		 	   format.js
		 	end
		 end
	end
	def article_title
		@title = Article.find_by(title:params[:title])
		render json: @title.nil? ? {'msg':true} : {'msg':false}
	end
	private
	def article_params
		params[:article].permit(:title,:category_id,:body,:publish_date,:image,:slug)
	end
end 
