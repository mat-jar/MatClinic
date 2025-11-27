require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module MatClinic
  class Application < Rails::Application
    config.load_defaults 7.0

    # Duplicate arrays to avoid FrozenError
    config.eager_load_paths = config.eager_load_paths.dup
    config.autoload_paths = config.autoload_paths.dup

    # If using autoload_lib, duplicate ignored list
    config.autoload_lib(ignore: %w[assets tasks].dup)
  end
end
