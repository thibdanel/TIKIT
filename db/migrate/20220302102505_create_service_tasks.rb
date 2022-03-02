class CreateServiceTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :service_tasks do |t|
      t.string :title
      t.string :description
      t.integer :offset_day
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
