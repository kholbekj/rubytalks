Lotus::Model.migration do
  change do
    create_table :talks do
      primary_key :id
      column :title, String, null: false
      column :author, String, null: false
      column :link, String
    end
  end
end
