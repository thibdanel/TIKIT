class CreateUserServices < ActiveRecord::Migration[6.1]
  def change
    create_table :user_services do |t|
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_name
      t.string :contact_address
      t.references :service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
