require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shelter
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.after_initialize do
      Repository.delay.sync_from_registry
    end

    config.i18n.available_locales = %w(en zh-CN)
    config.action_cable.mount_path = '/cable'
    config.action_cable.disable_request_forgery_protection = true
  end
end
