class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |c|
      c.string :name
    end
  end
end
