class CreateHomeworks < ActiveRecord::Migration
	def change
		create_table :homeworks do |t|
			t.string :pencils
			t.text :pens
			t.integer :erasers
			t.boolean :dolphins
		end
	end
end