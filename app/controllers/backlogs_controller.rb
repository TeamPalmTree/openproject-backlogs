class BacklogsController < ApplicationController
  unloadable

 	menu_item :backlogs

 	before_filter :load_project, :authorize
 	before_filter :load_backlog_menu_items, :only => [:index]

 	def load_project
		@project = Project.find(params[:project_id])
	end

	def load_backlog_menu_items
		Redmine::MenuManager.loose :project_menu do |menu|
			Version.visible.each do |version|
				menu.push version.name,
		            { controller: '/backlogs', :action => :index },
		            param: :project_id,
		            caption: version.name,
		            parent: :backlogs,
		            html: { class: 'icon2 icon-table-view' }
	        end
		end
	end

	def index
	end

end
