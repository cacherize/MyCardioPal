class RemoveDistanceUnitsColumnFromWorkouts < ActiveRecord::Migration
  def up
    remove_column :workouts, :distance_units
  end

  def down
    add_column :workouts, :distance_units, :string
  end
end
