require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module SoprPlatform
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Forces application to not access DB or load models when precompiling
    config.assets.initialize_on_precompile = false

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # add app/assets/fonts to the asset path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # Enforce I18n locales in Rails and gems
    # This will be a default configuration in future releases
    config.i18n.enforce_available_locales = true
    I18n.enforce_available_locales = true
  end
end
