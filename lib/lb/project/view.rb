# frozen_string_literal: true

module LB
  module Project
    # Base view
    class View < Dry::View::Controller
      extend LB::Project::Registry::Registration[:view]

      def self.setup(view)
        view.setting :paths, [LB::Project.template_path]
        view.setting :layout, 'main'
      end

      def with(_options)
        self
      end
    end
  end
end
