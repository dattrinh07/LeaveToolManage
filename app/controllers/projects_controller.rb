class ProjectsController < ApplicationController

	def index
		@listproject = Project.all
		@project = Project.new
		@user = ProjectUser.new
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


	def add_member
		binding.pry
		@project = Project.new(project_params)
		@project.users_in_projects.create(user_id: v)
		# if @project.save
		# 	respond_to do |format|
		#     	format.js
		#     end
		# end
	end

	private
	def member_params
		value_params = params.require(:project_user).permit(:full_name)
		value_params[:user_id] = params[:user_id]
		value_params[:project_id] = params[:project_id]
		value_params
	end

	def project_params
		value_params = params.require(:project).permit(:title, :description, :project_manage_id)
		value_params[:project_manage_id] = params[:project_manage_id]
		value_params
	end
end