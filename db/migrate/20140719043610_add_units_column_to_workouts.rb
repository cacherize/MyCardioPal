class AddUnitsColumnToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :unit, :string
  end
end
