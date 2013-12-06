require 'active_record'
require 'timers'
require 'border_patrol/configuration'

module BorderPatrol
  extend self

  RAKE_COMMANDS_TO_IGNORE = %w[
    db:create
    db:drop
    db:fixtures:load
    db:migrate
    db:migrate:status
    db:rollback
    db:schema:dump
    db:schema:load
    db:seed
    db:setup
    db:structure:dump
    db:version
  ].freeze

  attr_accessor :configuration

  def configure
    self.configuration ||= Configuration.new
    yield configuration if block_given?

    # Don't perform the tests in console mode, unless requested.
    return if console? && configuration.ignore_console

    # Don't perform the tests during DB operations.
    return if during_db?

    # Perform initial test.
    abort_if_pending

    # Unless requested otherwise, start polling for new migrations and if new migrations were pended
    # indeed - terminate the server.
    start if configuration.terminate
  end

  at_exit do
    @thread.exit if @thread
  end

  private
  def pending_migrations
    ActiveRecord::Migrator.new(:up, ActiveRecord::Migrator.migrations_paths).pending_migrations
  end

  def abort_if_pending
    if pending_migrations.any?
      puts 'Border Patrol:'
      puts "You have #{pending_migrations.size} pending migrations:"
      pending_migrations.each do |pending_migration|
        puts '  %4d %s' % [pending_migration.version, pending_migration.name]
      end
      puts 'Run `rake db:migrate` to update your database then try again.'

      stop
    end
  end

  def console?
    defined?(Rails::Console)
  end

  def during_db?
    RAKE_COMMANDS_TO_IGNORE.any? { |command| rake_command?(command) }
  end

  def rake_command?(command)
    File.basename($0) == 'rake' && ARGV.include?(command)
  end

  def start
    @thread = Thread.new do
      @timers = Timers.new
      @timers.every(configuration.polling_period) { abort_if_pending }

      loop do
        @timers.wait
      end
    end
  end

  def stop
    abort
  end
end
