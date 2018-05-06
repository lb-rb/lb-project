# frozen_string_literal: true

module LB
  module Project
    # Page view
    class Page < View
      extend LB::Project::Registry::Registration[:page]

      def title
        t = LB::Project.t.page
        self.class.page_key.split('/').each do |key|
          t = t.send(key)
        end

        t.title
      end
    end
  end
end
