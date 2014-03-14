ENV["QUIZ_ENV"] = "001_02_migrations"

require 'spec_helper'

if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate('spec/001.migrations/02_migrations')
end