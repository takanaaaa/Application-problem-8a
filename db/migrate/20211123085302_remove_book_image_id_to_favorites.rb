class RemoveBookImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :book_image_id, :string
  end
end