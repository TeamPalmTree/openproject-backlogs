OpenProject::Application.routes.draw do
	get '/projects/:project_id/agile', :to => 'agile#index', as: 'agile_mode'
	get '/projects/:project_id/agile/backlogs', :to => 'agile#backlogs', as: 'agile_backlogs'
	get '/projects/:project_id/agile/board/:version', :to => 'agile#board', as: 'agile_board'
	get '/projects/:project_id/agile/graph/:graph', :to => 'agile#graph', as: 'agile_graph'
end