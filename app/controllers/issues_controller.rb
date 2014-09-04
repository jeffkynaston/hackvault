class IssuesController < ApplicationController

	def index
		@issues = Issue.all
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

end
