require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DefaultPqslApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # ! The two below can be useful to avoid an apparently devise-caused issue
    # ! complaining about a disabled cookie store
    # ! https://github.com/waiting-for-dev/devise-jwt/issues/235
    # ! Which resulted in the following PR
    # ! https://github.com/heartcombo/devise/pull/5474/files
    # This also configures session_options for use below
    # config.session_store :cookie_store, key: ENV['COOKIE_SECRET_KEY']
    # config.middleware.use config.session_store, expire_after: 2.days
    # Below is a template
    # config.middleware.use config.session_store, config.session_options

    # Required for all session management (regardless of session_store)
    # config.middleware.use ActionDispatch::Cookies

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
