class AddCoordinatesToUserService < ActiveRecord::Migration[6.1]
  def change
    add_column :user_services, :latitude, :float
    add_column :user_services, :longitude, :float
  end
end
