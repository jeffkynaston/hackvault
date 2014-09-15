class ResourcesController < ApplicationController

	respond_to :html, :js

	def index
		if params[:search]
      @resources = Resource.search(params[:search]).order("lower(title)")
    else
      @resources = Resource.all.order("lower(title)")
    end
    if params["sort_info"]
			case params["sort_info"]["sort_direction"]
			when "z-a"
			  @resources = Resource.all.order("lower(title)").reverse
			when "newest"
			  @resources = Resource.all.order("CREATED_AT").reverse
			when "oldest"
			  @resources = Resource.all.order("CREATED_AT")
			else
			  @resources = Resource.all.order("lower(title)")
			end
		end
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@issues = Issue.all.map { |issue| issue.title }
		@categories = Category.all
		@resource = Resource.new
		if params["issue_info"]
			@current_issue = params["issue_info"]["issue_id"]
		end
	end

	def show
		@resource = Resource.find(params[:id])
		@resource.title = "Resource Title" if @resource.title == ""
	end

	def create
		resource = Resource.new(params.require(:resource).permit(:title, :description, :link, issue_ids: [], category_ids: []))
		# resource.assign_categories(params["resource"]["category_ids"])
		# resource.assign_issues(params["resource"]["issue_ids"])
		resource.user = current_user if user_signed_in?
		resource.save
		if params["resource"]["issue_answer"]
			current_issue = Issue.find(params["resource"]["issue_id"])
			resource.issues << current_issue
			redirect_to issue_path(current_issue)
		else
			redirect_to resources_path
		end
	end

	def edit
		@resource = Resource.find(params[:id])

	end

	def update
		resource = Resource.update(params[:id], params.require(:resource).permit(:title, :description, :link, issue_ids: [], category_ids: []))
		resource.user = current_user if user_signed_in?
		resource.save
		redirect_to resources_path(resource)
	end
end
