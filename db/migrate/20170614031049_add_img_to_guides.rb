class AddImgToGuides < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :img, :text
  end
end
