class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@resource = Resource.new
	end

	def show
		@resource = Resource.find(params[:id])
	end

	def create
		resource = Resource.new(params.require(:resource).permit(:title, :description, :link))
		resource.user = current_user if user_signed_in?
		resource.save
		redirect_to resources_path
	end
end
