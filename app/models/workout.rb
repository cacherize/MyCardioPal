class Workout < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :time, :date, :distance, :incline, :note, :distance_units, :weight, :weight_units

  def time=(values)
    hours = values[:hours].to_i * 3600
    minutes = values[:minutes].to_i * 60
    seconds = values[:seconds].to_i
    self[:time] = hours + minutes + seconds
  end
end
