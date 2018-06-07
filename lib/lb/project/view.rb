# frozen_string_literal: true

module LB
  module Project
    # Base view
    class View < Dry::View::Controller
      extend LB::Project::Registry::Registration[:view]

      def self.setup(view, layout = 'main')
        view.setting :paths, [LB::Project.template_path]
        view.setting :layout, layout
      end

      attr_reader :site

      def with(options)
        @site = options.fetch(:site, LB::Project.settings.site.new)
        self
      end

      def view(name, overrides = {})
        LB::Project::View.view_registry[name]
                         .new
                         .with(overrides.merge(site: site))
                         .render
      end

      def render(locals = {})
        render_with(site, self, locals)
      end

      def render_with(site, page, locals = {})
        call(with_context(site, page, locals))
      end

      def with_context(site, page, locals = {})
        {
          context: ::Struct.new(:site, :page).new(site, page),
          locals: locals
        }
      end
    end
  end
end
