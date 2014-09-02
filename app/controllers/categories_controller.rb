class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
		@category.title = "Category Title" if @category.title = ""

	end

	def create
		Category.create(params.require(:category).permit(:title, :description, :link))
		redirect_to categories_path
	end
end
