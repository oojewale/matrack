require "sqlite3"
module Matrack
  class DataManger
    attr_reader :conn
    def self.connection
      @conn = SQLite3::Database.new "#{self.class}.db"
    end

    def allowed_field_types
      {
        "int" => INTEGER,
        "str" => VARCHAR,
        "time" => VARCHAR,
        "date" => VARCHAR,
        "nil" => NULL
       }
    end

    def create_table(table_name, field_hash)
      if verify_col_type(field_hash) == true
        db_str = DataUtility.type_mapper(field_hash)
        begin
          conn.execute "CREATE TABLE IF NOT EXISTS #{table_name} (#{db_str});"
        rescue SQLite3::Exception => exp
          "This error occured: #{exp}"
        end
      else
        verify_col_type(field_hash)
      end
    end

    def verify_col_type(field_hash)
      if field_hash.values.all? { |val| allowed_field_types.keys.include? val }
        valid_time = DataUtility.timer_checker(field_hash)
        valid_date = DataUtility.date_checker(field_hash)
        return true if valid_time && valid_date
        return "Invalid date or date format. Check documentation."
      end
      "Invalid column type(s) specified"
    end

    # def self.generate_schema
    #   @schema = {}
    #   self.table_info(table_name) do |row|
    #     @schema[row["name"]] = row["type"]
    #   end
    # end

  end
end