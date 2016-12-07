# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# load schema

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
#load "#{Rails.root.to_s}/db/schema.rb" # use db agnostic schema by default
ActiveRecord::Migrator.up('db/migrate') # use migrations

puts "needs_migration: #{ActiveRecord::Migrator.needs_migration?}"
puts "any_migrations: #{ActiveRecord::Migrator.any_migrations?}"
puts "Base.connection_config #{ActiveRecord::Base.connection_config}"
versions = ActiveRecord::Migrator.get_all_versions
puts "get_all_versions #{versions}"
#(migrations(migrations_paths).collect(&:version)
migrations = ActiveRecord::Migrator.migrations(ActiveRecord::Migrator.migrations_paths).collect(&:version)
puts "migrations: #{migrations}"
puts "migrations - versions #{migrations - versions}"

# see
# atom `bundle show activerecord`/lib/active_record/migration.rb:572


# aus schema_statements.rb

migrations_paths = ActiveRecord::Migrator.migrations_paths
paths = migrations_paths.map {|p| "#{p}/[0-9]*_*.rb" }
versions = Dir[*paths].map do |filename|
  filename.split('/').last.split('_').first.to_i
end

puts "versions: #{versions}"


# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
