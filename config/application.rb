require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExchangeRates
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Europe/Moscow'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W[#{config.root}/app/workers #{config.root}/lib]

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'http://localhost:3001',
      'Access-Control-Request-Method' => %w[GET POST OPTIONS].join(',')
    }
  end
end
