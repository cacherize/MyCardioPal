class AddWeightColumnToExercises < ActiveRecord::Migration
  def change
    add_column :workouts, :weight, :integer
    add_column :workouts, :weight_units, :string
  end
end
