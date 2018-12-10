# frozen_string_literal: true

module LB
  module Project
    # Base route
    class Route < Roda
      def self.setup(route, options = { locale: ['en'] })
        translations = [File.join(LB::Project.root, 'locales')]
        route.plugin :i18n, locale:       options.fetch(:locale),
                            translations: translations
        route.opts[:root] = LB::Project.root
        route.plugin :public, root: LB::Project.config.public_path
        route.plugin :flash
        route.plugin :lb_project
        route.plugin :json
      end
    end
  end
end
