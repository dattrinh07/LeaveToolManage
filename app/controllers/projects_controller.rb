class ProjectsController < ApplicationController

	def index
		@listproject = Project.all
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			respond_to do |format|
		    	format.js
		    end
		end
	end

	def edit
		@project = Project.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			respond_to do |format|
		    	format.js
		    end
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	private
	def project_params
		params.require(:project).permit(:title, :description)
	end
end