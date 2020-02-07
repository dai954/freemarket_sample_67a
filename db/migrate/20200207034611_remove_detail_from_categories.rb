class RemoveDetailFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :detail
  end
end
