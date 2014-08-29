class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@category = Category.new
	end

	def show
		p params[:id]
		@category = Category.find(params[:id])
	end

	def create
		Category.create(params.require(:category).permit(:title, :description, :link))
		redirect_to categories_path
	end
end
