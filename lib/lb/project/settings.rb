# frozen_string_literal: true

module LB
  module Project
    # Settings supplied to LB::Project.setup
    class Settings < Dry::Struct
      attribute :root, Types::Strict::String
      attribute :config, LB::Project::Config
      attribute :site, Types::Strict::Class.default(LB::Project::Site)
    end
  end
end
