class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :email
      t.string :password
      t.string :tel
      t.string :sex
      t.string :birthday
      t.string :block
      t.timestamps
    end
  end
end
