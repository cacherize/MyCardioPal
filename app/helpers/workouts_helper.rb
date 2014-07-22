module WorkoutsHelper
  def date_field_value(workout, params)
    if workout.new_record?
      value = (params.blank? ? Date.today : params[:date])
    else
      value = (params.blank? ? workout.date : params[:date])
    end

    unless value.is_a? Date
      begin
        value = Date.strptime(value, "%m %d %Y")
      rescue ArgumentError => e
        value = nil
      else
        value = value.strftime("%-m-%-d-%Y")
      end
    else
      value = value.strftime("%-m-%-d-%Y")
    end
    return value
  end

  def weight_units_field_value(params)
    if params.present? && params[:weight].present?
      value = params[:weight][:units]
    else
      current_user.default_mass_unit
    end
  end

  def distance_units_field_value(params)
    if params.present? && params[:distance].present?
      value = params[:distance][:units]
    else
      current_user.default_distance_unit
    end
  end

  def weight_field_value(workout, params)
    value = (params.present? ? params[:weight][:value] : workout.default_weight_value)
    return value
  end

  def distance_field_value(workout, params)
    value = (params.present? ? params[:distance][:value] : workout.default_distance_value)
    return value
  end

  def time_field_value(workout, params, field)
    if params.blank?
      return nil if workout.new_record?
      workout.time_value(field)
    else
      params[:time][field]
    end
  end
end
