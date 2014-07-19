class RenameDistanceWeightColumnInWorkouts < ActiveRecord::Migration
  def up
    rename_column :workouts, :unit, :distance_units
  end

  def down
    rename_column :workouts, :distance_units, :unit
  end
end
