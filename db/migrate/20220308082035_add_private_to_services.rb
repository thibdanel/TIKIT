class AddPrivateToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :private, :boolean, default: true
  end
end
