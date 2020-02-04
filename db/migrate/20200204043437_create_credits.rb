class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.text :name
      t.text :number
      t.integer :security
      t.text :company
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
