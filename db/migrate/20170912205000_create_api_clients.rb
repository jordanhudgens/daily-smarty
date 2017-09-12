class CreateApiClients < ActiveRecord::Migration[5.1]
  def change
    create_table :api_clients do |t|
      t.string :source_app
      t.text :api_key

      t.timestamps
    end
  end
end
