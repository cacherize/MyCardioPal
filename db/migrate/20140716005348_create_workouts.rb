class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.integer :time #seconds
      t.integer :distance #feet
      t.integer :incline #percentage
      t.date :date
      t.string :note, limit: 2048
      t.timestamps
    end
  end
end
