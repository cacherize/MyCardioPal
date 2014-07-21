class AddUnitsPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :measurement_system, :string, default: 'imperial'
  end
end
