# frozen_string_literal: true

module LB
  module Project
    # LB::Project API
    module API
      # Get root path
      #
      # @return [dir_name]
      #
      # @api private
      #
      def root
        LB::Project.root
      end

      # Get root path for file
      #
      # @param [File] file The file to get the root path from
      # @param [File] depth The depth of the given file relative from the root
      # directory
      #
      # @return [dir_name]
      #
      # @api private
      #
      def root_for(file, depth = 2)
        LB::Project.root_for(file, depth)
      end

      # Get template path
      #
      # @return [dir_name]
      #
      # @api private
      #
      def self.template_path
        LB::Project.template_path
      end

      # Get public path
      #
      # @return [dir_name]
      #
      # @api private
      #
      def self.public_path
        LB::Project.public_path
      end

      # Get main configuration
      #
      # @return [Config]
      #
      # @api private
      #
      def self.config
        LB::Project.config
      end

      def self.t(*params)
        LB::Project.t(*params)
      end

      def self.logger
        LB::Project.logger
      end
    end
  end
end
