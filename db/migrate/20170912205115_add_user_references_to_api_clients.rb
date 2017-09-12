class AddUserReferencesToApiClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :api_clients, :user, foreign_key: true
  end
end
