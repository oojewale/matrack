class DataUtility
  def self.table_name(name)
    name.to_snake_case + "s"
  end

  def self.timer_checker(field_hash)
    time_arr = []
    field_hash.each_pair { |k,v| time_arr << k if v == "time" }
    unless time_arr.empty?
      time_arr.all? { |t| t =~ /[\d]{2}:[\d]{2}:[\d]{2}/ } ? true : false
    else
      true
    end
    # time_val =~ /[\d]{2}:[\d]{2}:[\d]{2}/ ? time_val : "Invalid time format"
  end

  def self.date_checker(field_hash)
    date_arr = []
    field_hash.each_pair { |k,v| date_arr << k if v == "date" }
    unless date_arr.empty?
      date_arr.all? { |d| d =~ /[\d]{4}-[\d]{2}-[\d]{2}/ } ? true : false
    else
      true
    end
    # date_val =~ /[\d]{4}-[\d]{2}-[\d]{2}/ ? date_val : "Invalid date format"
  end

  def self.type_mapper(field_hash)
    db_data = {}
    field_hash.each_pair do |k, v|
      db_data[k] = v == "str" || v == "time" ||  v == "date" ? "Varchar" : val
    end
    db_data.delete("id") if db_data.keys.include? "id"
    db_data.merge!("id" => "INTEGER PRIMARY KEY AUTOINCREMENT")
    create_table_query(db_data)
  end

  def self.create_table_query(db_data)
    db_str = ""
    db_data.each_pair do |k,v|
      db_str +=" " + "#{k}" + " " + "#{v}"
      db_str += "," unless k == db_data.keys.last
    end
    db_str
  end
end
