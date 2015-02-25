class BacklogsController < ApplicationController
  unloadable

  	menu_item :agile

	before_filter :find_project, :authorize
	before_filter :find_backlogs, :only => [:index, :backlogs]
	before_filter :find_board, :only => [:board]
	before_filter :find_report, :only => [:report]

	include AgileHelper

	def index
		@partial = 'backlogs'
		@object = { :backlogs => @backlogs }
	end

	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_backlogs
		@backlogs = {
			:versions => Version.visible.includes(fixed_issues: [:assigned_to, :tracker, :priority, :category, :fixed_version]),
			:product => Issue.visible.open.where(fixed_version_id: nil)
		}
	end

	def find_board
		@board = Issue.all
	end

	def find_report
		@report = Issue.all
	end

	def backlogs
		@partial = 'backlogs'
		@object = { :backlogs => @backlogs }
		respond_to do |format|
			format.html { render 'index' }
			format.js { render 'fetch' }
		end
	end

	def board
		@partial = 'board'
		@object = { :board => @board }
		respond_to do |format|
			format.html { render 'index' }
			format.js { render 'fetch' }
		end
	end

	def report
		@partial = 'report'
		@object = { :report => @report }
		respond_to do |format|
			format.html { render 'index' }
			format.js { render 'fetch' }
		end
	end

end
