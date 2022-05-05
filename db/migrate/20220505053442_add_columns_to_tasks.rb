class AddColumnsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :expired_at, :date, default: '2022-1-1', null: false
    add_column :tasks, :status, :integer, default: 0, null: false
  end
end
