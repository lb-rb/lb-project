# frozen_string_literal: true

require 'json'
require 'yaml'

# Web
require 'roda'
require 'roda/plugins/public'
require 'rack/csrf'

# r18n
require 'r18n-core'

# Dry
require 'dry-types'
require 'dry-struct'
require 'dry-view'
require 'dry-initializer'

# Version
require 'lb/project/version'

# Custom Types
require 'lb/project/types'

# Site
require 'lb/project/site'

# Config
require 'lb/project/config'
require 'lb/project/settings'

# LB namespace
module LB
  # Project
  module Project
    ERROR_MSG = 'Setup failed: settings is not a LB::Project::Settings'

    # Setup
    #
    # @param [settings] project settings
    #
    # @return [self]
    #
    # @api private
    #
    def self.setup(settings)
      unless settings.is_a?(LB::Project::Settings)
        raise ArgumentError,
              ERROR_MSG
      end

      @settings = settings

      self
    end

    def self.settings
      @settings
    end

    # Get root path
    #
    # @return [dir_name]
    #
    # @api private
    #
    def self.root
      @settings.root
    rescue NoMethodError
      raise ArgumentError, 'Call LB::Project.setup(...) first!'
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
    def self.root_for(file, depth = 2)
      path = File.expand_path(file)
      depth.times { path = File.dirname(path) }
      path
    end

    # Get template path
    #
    # @return [dir_name]
    #
    # @api private
    #
    def self.template_path
      File.join(root, config.template_path)
    end

    # Get public path
    #
    # @return [dir_name]
    #
    # @api private
    #
    def self.public_path
      File.join(root, config.public_path)
    end

    # Get main configuration
    #
    # @return [Config]
    #
    # @api private
    #
    def self.config
      @settings.config
    rescue NoMethodError
      raise ArgumentError, 'Call LB::Project.setup(...) first!'
    end

    def self.t(*params)
      R18n.t(*params)
    end

    def self.logger
      @logger ||= create_logger
    end

    def self.create_logger
      logger = Logger.new(STDOUT)
      logger.level = Logger::INFO
      logger
    end

    private_class_method :create_logger
  end
end

# API
require 'lb/project/api'

# Routing
require 'lb/project/route'
require 'lb/project/app'

# Registry
require 'lb/project/registry'
require 'lb/project/registry/registration'

# Views
require 'lb/project/view'
require 'lb/project/page'

# Render
require 'lb/project/render'

# Roda Plugin
require 'lb/project/roda'
