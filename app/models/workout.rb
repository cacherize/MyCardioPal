class Workout < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :time, :date, :distance, :incline, :note, :distance_units, :weight, :weight_units

  include UnitConversions

  #***** Validations *****#
  validates_presence_of [:date, :time, :weight], message: 'is required'
  validates :time, numericality: {greater_than: 59, message: 'must at least 1 minute'}, if: lambda{self.time.present?}
  validates :weight, numericality: {greater_than: 1, message: "doesn't meet minimum allowed value"}, if: lambda{self.weight.present?}
  validate :date_class, if: lambda{self.date.present?}

  def date_class
    errors.add(:date, 'must be a valid format (ex: mm-dd-yyyy or mm/dd/yyyy)') unless self.date.is_a? Date
  end

  def time=(args)
    return if args.values.all?{|val| val.blank?}
    hours = args[:hours].to_i * 3600
    minutes = args[:minutes].to_i * 60
    seconds = args[:seconds].to_i
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
end
