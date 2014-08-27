class IssuesController < ApplicationController

	def index
		@issues = Issue.all
		@current_uri = request.env['PATH_INFO']
	end

	def new
		@issue = Issue.new
	end

	def show
		p params[:id]
		@issue = Issue.find(params[:id])
	end

	def create
		Issue.create(params.require(:issue).permit(:title, :description, :link))
		redirect_to issues_path
	end

end
