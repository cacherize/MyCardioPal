class Workout < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :time, :date, :distance, :incline, :note
end
