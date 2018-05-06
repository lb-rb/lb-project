# frozen_string_literal: true

# Slim
require 'slim'

require 'lb-project'

# Example project
module Example
  LB::Project.setup(LB::Project.root_for(__FILE__))
end

require 'example/app'
require 'example/page'
require 'example/page/index'
