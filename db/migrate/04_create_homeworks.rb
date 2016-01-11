class CreateHomeworks < ActiveRecord::Migration

  def change
    create_table :homeworks do |t|
      t.string :class
      t.datetime :due
      t.integer :worth
      t.float :grade
    end
  end

end
