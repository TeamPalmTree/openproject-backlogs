OpenProject::Application.routes.draw do
	get '/projects/:project_id/backlogs/product', :to => 'backlogs#product', as: 'backlogs_product'
	get '/projects/:project_id/backlogs/board/:version', :to => 'backlogs#board', as: 'backlogs_board'
	get '/projects/:project_id/backlogs/reports', :to => 'backlogs#product', as: 'backlogs_reports'
	get '/projects/:project_id/backlogs/report/:report', :to => 'backlogs#graph', as: 'backlogs_report'
end