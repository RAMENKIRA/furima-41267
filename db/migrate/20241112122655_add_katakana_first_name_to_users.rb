class AddKatakanaFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :katakana_first_name, :string
  end
end
