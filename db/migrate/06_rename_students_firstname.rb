class RenameStudentsFirstname < ActiveRecord::Migration
	def change
		change_table :students do |t|
		  t.rename :firstname, :first_name 
		end  
	end
end