require "bundler/setup"
Bundler.setup

workers 3

prune_bundler true

x = nil
on_worker_boot do
  require "sidekiq"
  require "./config/initializers/sidekiq"

  x = Sidekiq.configure_embed do |config|
    # config.logger.level = Logger::DEBUG
    config.queues = %w[critical default low]
    config.concurrency = 2
  end
  x.run
end

on_worker_shutdown do
  x&.stop
end
