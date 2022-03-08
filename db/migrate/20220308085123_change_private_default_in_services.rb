class ChangePrivateDefaultInServices < ActiveRecord::Migration[6.1]
  def change
    change_column_default :services, :private, from: nil, to: true
  end
end
