# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'open_project/plugins'

module OpenProject::Backlogs
  class Engine < ::Rails::Engine
    engine_name :openproject_backlogs

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-backlogs',
    :author_url => 'http://finn.de',
    :requires_openproject => '>= 3.0.0pre13' do

      project_module :backlogs do

        permission :view_backlogs, {
          :backlogs => [:index]
        }

        menu :project_menu,
          :backlogs,
          { :controller => '/backlogs', :action => :index },
          :caption => 'Backlogs',
          :after => :work_packages,
          :param => :project_id,
          :html => {:class => 'icon2 icon-backlogs-icon'}

        menu :project_menu,
          :view_all,
          { controller: '/backlogs', :action => :index },
          param: :project_id,
          caption: 'View All',
          parent: :backlogs,
          html: { class: 'icon2 icon-sort-by' }

        Version.all.each do |version|
          menu :project_menu,
            version.id,
            { controller: '/backlogs', :action => :index },
            param: :project_id,
            caption: version.name,
            parent: :backlogs,
            html: { class: 'icon2 icon-table-view' }
        end

        menu :project_menu,
          :reports,
          { controller: '/backlogs', :action => :index },
          param: :project_id,
          caption: 'Reports',
          parent: :backlogs,
          html: { class: 'icon2 icon-stats2' }

      end

    end

  end
end
