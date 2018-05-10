# frozen_string_literal: true

module LB
  module Project
    # Base route
    class Route < Roda
      def self.setup(route)
        translations = [File.join(LB::Project.root, 'locales')]
        route.plugin :i18n, translations: translations
        route.opts[:root] = LB::Project.root
        route.plugin :public, root: 'docs'
        route.plugin :flash
        route.plugin :lb_project
        route.plugin :json
      end
    end
  end
end
