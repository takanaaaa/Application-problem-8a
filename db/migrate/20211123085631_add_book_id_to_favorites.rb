class AddBookIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :book, foreign_key: true
  end
end
