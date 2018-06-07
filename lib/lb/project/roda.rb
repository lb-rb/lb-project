# frozen_string_literal: true

class Roda
  # LB::Project Roda Plugins
  module RodaPlugins
    # LB::Project plugin
    module LBProject
      # Plugin instance methods
      module InstanceMethods
        def page(name, overrides = {})
          view_for(LB::Project::Page.page_registry, name, overrides)
        end

        def view(name, overrides = {})
          view_for(LB::Project::View.view_registry, name, overrides)
        end

        def view_for(registry, name, overrides)
          registry[name].new.with(overrides.merge(site: current_site)).render
        end

        def flush_flash
          flash.keep
          flash.sweep
        end

        private

        def current_site
          site.with_flash(flash)
        end

        def site
          LB::Project.settings.site.new.with(csrf_config.merge(session_config))
        end

        def csrf_config
          {
            csrf_token: -> { Rack::Csrf.token(request.env) },
            csrf_metatag: -> { Rack::Csrf.metatag(request.env) },
            csrf_tag: -> { Rack::Csrf.tag(request.env) }
          }
        end

        def session_config
          {
            session: -> { request.session }
          }
        end
      end

      # Plugin request methods
      module RequestMethods
        def parent
          File.dirname script_name
        end

        def redirect_parent
          redirect parent
        end
      end
    end

    register_plugin :lb_project, LBProject
  end
end
