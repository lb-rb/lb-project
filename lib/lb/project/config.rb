# frozen_string_literal: true

module LB
  module Project
    # Configuration
    class Config < Dry::Struct
      ERROR_MSG = 'load failed: config class is not a LB::Project::Condig'
      RequiredString = Types::Strict::String.constrained(min_size: 1)

      attribute :base_path, Types::Strict::String
      attribute :image_base_path, Types::Strict::String
      attribute :public_path, Types::Strict::String
      attribute :template_path, Types::Strict::String

      def self.load(path, klass = LB::Project::Config)
        raise ArgumentError, ERROR_MSG unless klass <= LB::Project::Config

        raise ArgumentError, not_found_msg(path) unless File.exist?(path)

        yaml = YAML.load_file(path)
        klass.new(yaml.transform_keys!(&:to_sym))
      end

      def self.not_found_msg(path)
        "load failed: config file '#{path}' does not exist!"
      end
    end
  end
end
