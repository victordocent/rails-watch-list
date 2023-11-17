class AddFrontPictureToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :front_picture, :string
  end
end
