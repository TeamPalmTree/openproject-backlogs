# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'open_project/plugins'

module OpenProject::Backlogs
  class Engine < ::Rails::Engine
    engine_name :openproject_backlogs

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-backlogs',
             :author_url => 'http://finn.de',
             :requires_openproject => '>= 3.0.0pre13'

    project_module :backlogs do

	    permission :view_backlogs, {
	    	:backlogs => [:index, :backlogs, :board, :graph]
	    }

		menu :project_menu,
		:backlogs,
		{ :controller => '/backlogs', :action => :index },
		:caption => 'Backlogs',
		:before => :calendar,
		:param => :project_id,
		:html => {:class => 'icon2 icon-backlogs-icon'}

	end

  end
end
