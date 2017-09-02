class CreateUserImages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_images do |t|
      t.text :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
