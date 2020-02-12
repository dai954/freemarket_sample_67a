class AddRubyLastToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ruby_last, :string
  end
end
