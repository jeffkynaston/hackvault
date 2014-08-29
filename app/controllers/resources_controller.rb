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
		if @resource.category == nil
	end

	def create
		Resource.create(params.require(:resource).permit(:title, :description, :link))
		redirect_to resoures_path
	end
end
