class ResourcesController < ApplicationController

	def index
		@resources = Resources.all
	end
end
