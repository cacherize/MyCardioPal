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
end