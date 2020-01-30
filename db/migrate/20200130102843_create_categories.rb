class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :genre
      t.text :subgenre
      t.text :detail
      t.timestamps
    end
  end
end
