# frozen_string_literal: true

require 'json'
require 'yaml'

# Web
require 'roda'
require 'roda/plugins/public'

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

# Config
require 'lb/project/config'

# LB namespace
module LB
  # Project
  module Project
    CONFIG_NAME = 'application'
    DEFAULT_RACK_ENV = 'development'

    # Setup
    #
    # @param [File] root Path to project root
    #
    # @return [self]
    #
    # @api private
    #
    def self.setup(root)
      @root = root

      self
    end

    # Get root path
    #
    # @return [dir_name]
    #
    # @api private
    #
    def self.root
      @root
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
      @config ||= Config.load(root, CONFIG_NAME, rack_env)
    end

    # Get RACK_ENV
    #
    # @return [String]
    #
    # @api private
    #
    def self.rack_env
      @rack_env ||= ENV.fetch('RACK_ENV', DEFAULT_RACK_ENV)
    end

    # Check if rack_env is 'development'
    #
    # @return [Boolean]
    #
    # @api private
    #
    def self.development?
      DEFAULT_RACK_ENV.eql? rack_env
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

# Site
require 'lb/project/site'

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
