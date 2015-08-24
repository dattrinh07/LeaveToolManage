class ProjectsController < ApplicationController

	def index
		@listproject = Project.all
	end
end