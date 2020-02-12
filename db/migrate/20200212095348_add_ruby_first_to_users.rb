class AddRubyFirstToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ruby_first, :string
  end
end
