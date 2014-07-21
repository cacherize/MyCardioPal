module UnitConversions
  def convert_to_feet(value, unit)
    v = value.to_f.round
    unless unit == "ft"
      if unit == "mi"
        v = v.miles.to.feet
      elsif unit == "km"
        v = v.kilometers.to.feet
      else
        v = v.meters.to.feet
      end
    else
      return v
    end
  end

  def distance_in_miles(distance)
    return 0 if distance.blank?
    distance.feet.to.miles.value
  end

  def distance_in_kilometers(distance)
    return 0 if distance.blank?
    distance.feet.to.kilometers.value
  end

  def weight_in_kilograms(weight)
    return 0 if weight.blank?
    weight.pounds.to.kilograms.value
  end
end