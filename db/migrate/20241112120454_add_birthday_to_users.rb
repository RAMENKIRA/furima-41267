class AddBirthdayToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Birthday, :date
  end
end
