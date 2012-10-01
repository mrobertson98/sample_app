require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
require "rails/all"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module SampleApp
  class Application < Rails::Application

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.enabled = true

    config.assets.version = '1.0'
    
    if Rails.env.test?
      initializer :after => :initialize_dependency_mechanism do
        ActiveSupport::Dependencies.mechanism = :load
      end
  end
end
end
