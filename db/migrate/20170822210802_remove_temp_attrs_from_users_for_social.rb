class RemoveTempAttrsFromUsersForSocial < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :image, :text
  end
end
