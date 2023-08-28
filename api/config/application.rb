require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Railsアプリのタイムゾーン
    # Dockerfileで設定した環境変数のタイムゾーンを取得
    config.time_zone = ENV["TZ"]

    # データベースの読み書きに使用するタイムゾーンの指定
    config.active_record.default_timezone = :utc

    # i18nで使われるデフォルトのロケールファイルの指定
    config.i18n.default_locale = :ja

    # $LOAD_PATHにautoload pathを追加しない(Zeitwerk有効時false推奨)
    config.add_autoload_paths_to_load_path = false

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
