class RenameStudentsFirstname < ActiveRecord::Migration

  def change
    rename_column(:students, :firstname, :first_name)
  end

end