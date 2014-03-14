ENV["QUIZ_ENV"] = "001_01_migrations"

require 'spec_helper'

if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate('spec/001.migrations/01_migrations')
end