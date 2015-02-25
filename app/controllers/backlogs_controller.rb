class BacklogsController < ApplicationController
  unloadable

 	menu_item :backlogs

 	before_filter :load_project, :authorize

 	def load_project
		@project = Project.find(params[:project_id])
	end

	def index
		Redmine::MenuManager.loose :project_menu do |menu|
			Version.all.each do |version|
				menu.push version.name,
	            { controller: '/backlogs', :action => :index },
	            param: :project_id,
	            caption: version.name,
	            parent: :backlogs,
	            html: { class: 'icon2 icon-table-view' }
	        end
		end
	end

end
