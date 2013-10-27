Sequel.migration do
  change do
    create_table(:students) do
      primary_key :id
      string :firstname
      string :last_name
      string :graduation_date
    end
  end
end
