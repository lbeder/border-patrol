require 'active_record'
require 'border_patrol/configuration'

module BorderPatrol
  extend self

  attr_accessor :configuration

  def configure
    self.configuration ||= Configuration.new

    yield configuration

    abort_if_pending
  end

  private
  def pending_migrations
    ActiveRecord::Migrator.new(:up, ActiveRecord::Migrator.migrations_paths).pending_migrations
  end

  def abort_if_pending
    if pending_migrations.any?
      puts "You have #{pending_migrations.size} pending migrations:"
      pending_migrations.each do |pending_migration|
        puts '  %4d %s' % [pending_migration.version, pending_migration.name]
      end
      abort %{Run `rake db:migrate` to update your database then try again.}
    end
  rescue ActiveRecord::ConnectionNotEstablished
  end
end

BorderPatrol.configure {}
