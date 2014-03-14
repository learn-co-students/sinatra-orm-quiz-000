ENV["QUIZ_ENV"] = "002_migrations"

require 'spec_helper'
require_relative './crowd_fundr_campaign'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/002_migrations.sqlite"
)