class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |h|
      h.string :subject
      h.integer :questions
      h.datetime :due_date
      h.float :grade
    end
  end
end
