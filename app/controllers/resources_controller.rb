class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@resource = Resource.new
	end

	def show
		p params[:id]
		@resource = Resource.find(params[:id])
	end

	def create
		Resource.create(params.require(:resource).permit(:title, :description, :link))
		redirect_to root_path
	end
end
