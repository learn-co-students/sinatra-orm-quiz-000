require 'spec_helper'

# Use https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.
describe "migrations" do
  describe "creating tables" do
    before do
      @path = File.dirname(__FILE__)
      @db = setup_database_for_migrations(@path, 'creating_tables.db')

      Sequel::Migrator.run @db, "#{@path}/01_migrations"
    end

    context "01_migrations" do
      context "/01_create_cats.rb" do
        it "should create a table called cats with a primary key 'id'" do
          @db.tables.should include(:cats)
          column = @db.schema(:cats).first
          column.first.should == :id
          column.last[:primary_key].should == true
        end
      end

      context "/02_create_dogs.rb" do
        it "should create a table called dogs using the 'up' and 'down' methods" do
          @db.tables.should include(:dogs)

          migration_text = File.read("#{@path}/01_migrations/02_create_dogs.rb")
          migration_text.match(/up do/).should_not == nil
          migration_text.match(/down do/).should_not == nil

          Sequel::Migrator.run(@db, "#{@path}/01_migrations", target: 1)

          @db.tables.should_not include(:dogs)
        end
      end
    end

    it "should create a table called hamsters using the 'change' method" do
    end 
  end
end
