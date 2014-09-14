class CategoriesController < ApplicationController

	def index
    if params[:search]
      @categories = Category.search(params[:search]).order("lower(title)")
    else
      @categories = Category.all.order("lower(title)")
    end
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
		@category.title = "Category Title" if @category.title == ""

	end

	def create
		category = Category.create(params.require(:category).permit(:title, :description, :link))
		category.user = current_user if user_signed_in?
		category.save
		redirect_to categories_path
	end

	def edit
		@category = Category.find(params[:id])

	end

	def update
		category = Category.create(params.require(:category).permit(:title, :description, :link))
		category.user = current_user if user_signed_in?
		category.save
		redirect_to category_path(category)
	end

end
