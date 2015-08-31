class CreateHomeworks < ActiveRecord::Migration

  def change
    create_table :homeworks do |t|
      t.string :subject
      t.integer :grade
      t.datetime :starting_time
      t.text :description
    end
  end

end