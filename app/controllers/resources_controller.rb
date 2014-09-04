class ResourcesController < ApplicationController

	def index
		@resources = Resource.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@issues = Issue.all.map { |issue| issue.title }
		@categories = Category.all
		@resource = Resource.new
	end

	def show
		@resource = Resource.find(params[:id])
		@resource.title = "Resource Title" if @resource.title == ""
	end

	def create
		p params
		resource = Resource.new(params.require(:resource).permit(:title, :description, :link, issue_ids: [], category_ids: []))
		# resource.assign_categories(params["resource"]["category_ids"])
		# resource.assign_issues(params["resource"]["issue_ids"])
		resource.user = current_user if user_signed_in?
		resource.save
		redirect_to resources_path
	end
end
