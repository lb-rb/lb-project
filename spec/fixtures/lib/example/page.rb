# frozen_string_literal: true

module Example
  # Base page
  class Page < LB::Project::Page
    LB::Project::View.setup(self)
  end
end
