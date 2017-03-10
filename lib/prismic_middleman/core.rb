require 'middleman-core'
require 'prismic'
require_relative 'helpers'
require_relative 'instance'

module PrismicMiddleman
  def self.instances
    @prismic_middleman_instances ||= []
  end

  class Core < ::Middleman::Extension
    self.supports_multiple_instances = true

    option :repository, nil,
      'The Prismic.io respository'

    option :access_token, nil,
      'The Prismic.io API access token'

    option :query, {},
      'The conditions that are used on the Prismic.io API to query for documents'

    helpers PrismicMiddleman::Helpers

    attr_reader :middleman_app
    def initialize(app, options_hash = {}, &block)
      super
      @middleman_app = app

      this = self # Hack due to context change
      app.before_server do
        this.webhook_options
      end
    end

    ##
    # Middleman hooks
    #
    def after_configuration
      PrismicMiddleman.instances << (PrismicMiddleman::Instance.new self)
    end
  end
end
