Sequel.migration do
  change do
    create_table(:cats) do
      primary_key :id
    end
  end
end