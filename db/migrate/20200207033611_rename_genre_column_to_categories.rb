class RenameGenreColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :genre, :name
  end
end
