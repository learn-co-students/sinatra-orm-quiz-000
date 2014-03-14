require 'spec_helper'

# TODO: Fill in migrations 06 and 07 in db/migrate to alter the tables as described
#       below. Don't edit 05_create_students.rb. Remember that migrations should
#       be additive.

describe "migrations" do
  describe "altering tables" do
    before do
      @path = File.dirname(__FILE__)
      @db = ActiveRecord::Base.connection
    end

    context "/06_rename_students_firstname.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 6)
      end

      it "renames the firstname column to first_name" do
        new_col = @db.columns("students").detect { |col| col.name == "first_name" }
        expect(new_col).to_not be_nil
      end
    end

    context "/07_change_students_birth_date_type.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 7)
      end

      it "changes birth_date to type datetime" do
        birth_date_col = @db.columns("students").detect { |col| col.name == "birth_date" }
        expect(birth_date_col.type.to_s).to eq("datetime")
      end
    end
  end
end
