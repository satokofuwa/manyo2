class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    add_index :tasks, :user_id
  end
end
