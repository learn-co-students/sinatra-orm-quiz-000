class CreateHomeworks < ActiveRecord::Migration
  def change
  	create_table :homeworks do |t|
  		t.string :title
  		t.text :content
  		t.integer :mark
  		t.timestamps null: false
  	end	
  end
end