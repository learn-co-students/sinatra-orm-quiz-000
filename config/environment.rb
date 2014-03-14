require 'uri'
require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/sinatra_orm_quiz.sqlite"
)