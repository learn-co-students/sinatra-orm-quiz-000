class CreateCats < ActiveRecord::Migration

  def change
    create_table :cats do |t|
      t.name
    end
  end

end