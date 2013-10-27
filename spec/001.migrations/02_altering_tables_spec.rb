require 'spec_helper'

# Use https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.
describe "migrations" do
  describe "altering tables" do
    before do
      @path = File.dirname(__FILE__)
      @db = setup_database_for_migrations(@path, 'altering_tables.db')

      Sequel::Migrator.run @db, "#{@path}/02_migrations"
    end

    context "02_migrations" do
      context "/02_rename_students_firstname.rb" do
        it "should rename the firstname column to first_name" do
          new_col = @db.schema(:students).detect { |col| col.first == :first_name }
          new_col.should_not == nil
        end
      end
    end
  end
end
