class RemoveWeightUnitsColumn < ActiveRecord::Migration
  def up
    remove_column :workouts, :weight_units
  end

  def down
    add_column :workouts, :weight_units, :string
  end
end
