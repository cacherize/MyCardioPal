class Workout < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :time, :date, :distance, :incline, :note, :distance_units, :weight, :weight_units
  validates :date, presence: {message: 'is required'}
  validates :time, presence: {message: 'is required'}, numericality: {greater_than: 59, message: 'must at least 1 minute'}
  validate :date_class, if: lambda{self.date.present?}

  def date_class
    errors.add(:date, 'must be a valid format (ex: mm-dd-yyyy or mm/dd/yyyy)') unless self.date.is_a? Date
  end

  def time=(values)
    hours = values[:hours].to_i * 3600
    minutes = values[:minutes].to_i * 60
    seconds = values[:seconds].to_i
    self[:time] = hours + minutes + seconds
  end

  def date=(value)
    return if value.blank?
    value.gsub!(/[-\/]/, " ")
    begin
      date = Date.strptime(value, "%m %d %Y")
    rescue ArgumentError => e
      date = 0
    end
    self[:date] = date
  end
end
