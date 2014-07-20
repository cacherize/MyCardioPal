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
end
