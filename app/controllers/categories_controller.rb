class CategoriesController < ApplicationController 
    # before_action :authenticate_user!,except: [:index,:show]    
	#load_and_authorize_resource 	
	def index 
		@categories = Category.all
		@category = Category.new
		
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(paramas_category)
		if @category.save
			respond_to do |format|
				format.js
			end
		end	
	end
	def show
		@category = Category.find(params[:id])
	end
	def find_category
		@category = Category.find_by(name:params[:name])
		render json: @category.nil? ? {'msg':true} : {'msg':false}
	end
	private
	def paramas_category
		params[:category].permit(:name,:description,:parent_id)
	end
end

