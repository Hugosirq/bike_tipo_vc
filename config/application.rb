require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BikeTipoVc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = 'Brasilia'
    I18n.enforce_available_locales = false
    config.i18n.default_locale = "en"
    config.encoding = "utf-8"
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += Dir[Rails.root.join("app", "jobs", "{*/}")]
    config.api_only = true
  end
end
