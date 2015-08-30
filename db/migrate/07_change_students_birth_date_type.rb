class ChangeStudentsBirthDateType < ActiveRecord::Migration
	def change
		change_column(:students, :birth_date, "datetime")
	end
end