class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :last_name
      t.string :birth_date
    end
  end
end
