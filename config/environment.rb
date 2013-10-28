require 'bundler/setup'
Bundler.require

require_relative '../spec/002.ORM/crowd_fundr_campaign'
::Sequel.extension :migration
