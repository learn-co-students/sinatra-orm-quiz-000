require 'spec_helper'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/001_02_migrations.sqlite"
)