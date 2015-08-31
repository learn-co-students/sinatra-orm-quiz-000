class CreateHamsters < ActiveRecord::Migration

  def change
    create_table :hamsters do |t|
      t.string :name

    end
  end

end