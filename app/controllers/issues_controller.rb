class IssuesController < ApplicationController
	respond_to :html, :js

	def index
		@issues = Issue.all.order("lower(title)")
		@featured_issue = Issue.last
		p  params
		if params["sort_info"]
			case params["sort_info"]["sort_direction"]
			when "z-a"
			  @issues = Issue.all.order("lower(title)").reverse
			when "newest"
			  @issues = Issue.all.order("CREATED_AT").reverse
			when "oldest"
			  @issues = Issue.all.order("CREATED_AT")
			else
			  @issues = Issue.all.order("lower(title)")
			end
		end
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@issue = Issue.new
	end

	def show
		@issue = Issue.find(params[:id])

		@issue.title = "Issue Title" if @issue.title == ""
	end

	def create
		issue = Issue.new(params.require(:issue).permit(:title, :description, :link, category_ids: []))
		# issue.assign_categories(params["issue"]["category_ids"])
		issue.user = current_user if user_signed_in?
		issue.save
		redirect_to issues_path
	end

	def edit
		@issue = Issue.find(params[:id])

	end

	def update
		issue = Issue.update(params[:id], params.require(:issue).permit(:title, :description, :link, category_ids: []))
		issue.user = current_user if user_signed_in?
		issue.save
		redirect_to issue_path(issue)
	end

end
