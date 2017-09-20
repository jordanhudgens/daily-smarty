class RemoveSourceAppFromApiClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :api_clients, :source_app, :string
  end
end
