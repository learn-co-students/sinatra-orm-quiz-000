class CreateHamsters < ActiveRecord::Migration

  def change
    create_table :hamsters do |t|
      t.name
    end
  end

end