class CreateHamsters < ActiveRecord::Migration
  def change
    create_table :hamsters do |h|
      h.string :name
    end
  end
end
