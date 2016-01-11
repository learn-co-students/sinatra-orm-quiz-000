class CreateDogs < ActiveRecord::Migration


  def up
    create_table :dogs do |t|
      t.name
    end
  end

  def down
    drop_table :dogs
  end

end