require 'bundler/setup'
Bundler.require

DB = Sequel.connect("sqlite://db/quiz.db")

Sequel.extension :migration
