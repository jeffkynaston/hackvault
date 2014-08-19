class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
	end

	def new
		@resource = Resource.new
	end

	def create
		Resource.create(params.require(:resource).permit(:title, :description, :link))
		redirect_to root_path
	end
end
