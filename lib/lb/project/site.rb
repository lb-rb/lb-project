# frozen_string_literal: true

module LB
  module Project
    # Site context for templates
    class Site
      include R18n::Helpers

      DEFAULT_MESSAGE_TYPES = {
        notice: { level: :success, timeout: 5 },
        alert:  { level: :error,   timeout: 0 }
      }.freeze

      def initialize(context = {})
        @context = context
      end

      def options
        @options ||= {}
      end

      def [](*args)
        options.fetch(*args)
      end

      def with(opts)
        options.merge!(opts)

        self
      end

      def path_for(bundle, type)
        path = 'webpack-assets.json'
        file = File.read(path)
        json = JSON.parse(file)
        LB::Project.config.base_path + json[bundle][type]
      end

      def js_for(bundle)
        path_for(bundle, 'js')
      end

      def css_for(bundle)
        path_for(bundle, 'css')
      end

      def image_path(path)
        "#{LB::Project.config.image_base_path}/#{path}"
      end

      def escaped_json(data)
        "JSON#{Rack::Utils.escape_html(JSON.generate(escape_all(data)))}"
      end

      def escape_all(data)
        case data
        when Array
          escape_array(data)
        when Hash
          escape_hash(data)
        when String
          Rack::Utils.escape_html(data)
        else
          data
        end
      end

      def escape_array(data)
        data.map(&method(:escape_all))
      end

      def escape_hash(data)
        data.map do |key, value|
          [key, escape_all(value)]
        end.to_h
      end

      def flash?
        %i[notice alert].any? { |type| flash[type] }
      end

      def with_flash(flash)
        with(flash: flash)
      end

      def flash
        self[:flash, {}]
      end

      def csrf_token
        self[:csrf_token].call
      end

      def csrf_metatag
        self[:csrf_metatag].call
      end

      def csrf_tag
        self[:csrf_tag].call
      end

      def session
        self[:session].call
      end

      def logged_in?
        session.key?(:user_id)
      end

      def message_types
        DEFAULT_MESSAGE_TYPES
      end

      def messages
        flash.map do |type, message|
          { message: message }.merge(message_types[type.to_sym])
        end
      end
    end
  end
end
