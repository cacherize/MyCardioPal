class Workout < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :time, :date, :distance, :incline, :note, :weight

  include UnitConversions

  belongs_to :user

  #***** Validations *****#
  validates_presence_of [:date, :time, :weight], message: 'is required'
  validates :time, numericality: {greater_than: 59, message: 'must be at least 1 minute'}, if: lambda{self.time.present?}
  validates :weight, numericality: {greater_than: 21, message: "doesn't meet minimum allowed value (10kg or 22lb)"}, if: lambda{self.weight.present?}
  validate :date_class, if: lambda{self.date.present?}

  def date_class
    errors.add(:date, 'must be a valid format (ex: mm-dd-yyyy or mm/dd/yyyy)') unless self.date.is_a? Date
  end

  #***** Setter & Getter Methods *****#
  def time=(args)
    (self[:time] = nil) && return if args.values.all?{|val| val.blank?}
    time = args[:hours].to_i * 3600
    time += args[:minutes].to_i * 60
    time += args[:seconds].to_i
    self[:time] = time
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

  def weight=(args)
    if args[:value].present? && args[:units].present?
      weight = args[:value].to_f.round
      weight = weight.kilograms.to.pounds.value.round if args[:units] == "kg"
      self[:weight] = weight
    else
      self[:weight] = nil
    end
  end

  def distance=(args)
    if args[:value].present? && args[:units].present?
      self[:distance] = convert_to_feet(args[:value], args[:units])
    else
      self[:distance] = nil
    end
  end

  #***** Model Methods *****#
  def time_value(field)
    time = Time.at(self.time).utc
    if field == :hours
      unit = "%H"
    elsif field == :minutes
      unit = "%M"
    elsif field == :seconds
      unit = "%S"
    end
    time.strftime(unit)
  end

  def default_distance_value
    return nil if self.new_record?
    user.imperial? ? distance_in_miles(self.distance) : distance_in_kilometers(self.distance)
  end

  def default_weight_value
    return nil if self.new_record?
    user.imperial? ? self.weight : weight_in_kilograms(self.weight)
  end
end
