module Payga
  class Engine < ::Rails::Engine
    isolate_namespace Payga

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "payga_migrations", before: :load_config_initializers do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path|
        Rails.application.config.paths["db/migrate"] << expanded_path
      end
    end
  end
end
