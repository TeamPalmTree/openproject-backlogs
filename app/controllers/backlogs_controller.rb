class BacklogsController < ApplicationController
  unloadable

 	menu_item :backlogs

 	before_filter :load_project, :authorize

 	def load_project
		@project = Project.find(params[:project_id])
	end

	def index
	end

end
