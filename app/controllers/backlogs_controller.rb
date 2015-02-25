class BacklogsController < ApplicationController
  unloadable

 	menu_item :backlogs

 	before_filter :load_project, :authorize
 	before_filter :load_backlogs, :only => [:index]

 	def load_project
		@project = Project.find(params[:project_id])
	end

	def load_backlogs
		@backlogs = {
			:versions => Version.visible.open.includes(
				fixed_issues: [:assigned_to, :priority, :category, :fixed_version]
			),
			:product => WorkPackage.visible.open.where(fixed_version_id: nil)
		}
	end

	def index
	end

end
