class DataUtility
  def self.table_name(name)
    name.to_snake_case + "s"
  end

  def self.timer_checker(time_val)
    time_val =~ /[\d]{2}:[\d]{2}:[\d]{2}/ ? time_val : "Invalid time format"
  end

  def self.date_checker(date_val)
    date_val =~ /[\d]{4}-[\d]{2}-[\d]{2}/ ? date_val : "Invalid date format"
  end

  def self.bool_checker(bool_val)
    return 1 if bool_val.to_b == true
    0
  end

end