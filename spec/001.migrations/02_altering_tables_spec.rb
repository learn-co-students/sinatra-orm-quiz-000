require_relative './001_migrations_02_spec_helper'

# TODO: fill in the migrations in 02_migrations/ to alter the tables as described
#       below don't edit 01_create_students.rb. Remember that migrations should
#       be additive.

describe "migrations" do
  describe "altering tables" do
    before do
      @path = File.dirname(__FILE__)
      ActiveRecord::Migrator.migrate("#{@path}/02_migrations")
      @db = ActiveRecord.connection
    end

    context "02_migrations" do
      context "/02_rename_students_firstname.rb" do
        it "renames the firstname column to first_name" do
          new_col = @db.columns("students").detect { |col| col.name == "first_name" }
          expect(new_col).to_not be_nil
        end
      end

      context "/03_change_students_birth_date_type.rb" do
        it "changes birth_date to type datetime" do
          birth_date_col = @db.columns("students").detect { |col| col.name == "birth_date" }
          expect(birth_date_col.type.to_s).to eq("datetime")
        end
      end
    end
  end
end
