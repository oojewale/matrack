class DataUtility
  class << self

    def type_mapper(field_hash)
      db_data = {}
      field_hash.each_pair do |k, v|
        v = v.to_s
        if v == "str" || v == "time" ||  v == "date"
          db_data[k] = "VARCHAR"
        elsif v == "int"
          db_data[k] = "INTEGER"
        end
      end
      db_data
    end

    def create_table_query(db_data)
      db_str = ""
      db_data.each_pair do |k,v|
        db_str +=" " + "#{k}" + " " + "#{v}"
        db_str += "," unless k == db_data.keys.last
      end
      db_str
    end

    def db_error(message)
      <<-EOS
            *************************************************
                DB ERROR - #{message.to_s.titleize}
            *************************************************
      EOS
    end
  end
end
