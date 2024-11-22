class AddKatakanaLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :katakana_last_name, :string
  end
end
