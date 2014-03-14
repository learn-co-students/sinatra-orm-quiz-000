ENV["QUIZ_ENV"] = "002_migrations"

require 'spec_helper'
require_relative './crowd_fundr_campaign'

if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate('spec/002.ORM/migrations')
end