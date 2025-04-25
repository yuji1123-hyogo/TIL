require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railbook
  class Application < Rails::Application
    config.active_job.queue_adapter = :delayed_job

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # config.action_view.sanitized_allowed_tags = %w(p a)
    # config.action_view.sanitized_allowed_attributes = %w(id class href style)

    # config.active_job.queue_name_prefix = Rails.env

    # config.action_controller.include_all_helpers = false

    # コントローラー／モデル単位に辞書ファイルを用意する場合
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # config.i18n.default_locale = :en
    # config.i18n.default_locale = :ja
    # config.i18n.default_locale = :de

    config.active_record.encryption.support_unencrypted_data = true
  end
end
