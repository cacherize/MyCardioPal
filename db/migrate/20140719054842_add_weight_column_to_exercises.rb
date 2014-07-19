class AddWeightColumnToExercises < ActiveRecord::Migration
  def change
    add_column :workouts, :weight, :integer
  end
end
