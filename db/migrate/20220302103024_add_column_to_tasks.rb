class AddColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true
    add_reference :tasks, :user_service, foreign_key: true, null: true
    add_column :tasks, :done, :boolean
  end
end
