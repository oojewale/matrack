require "sqlite3"
module Matrack
  class DataManger
    def self.connection
      SQLite3::Database.new "#{self.class}.db"
    end

    def allowed_field_types
      {
        "int" => Integer,
        "str" => Varchar,
        "time" => Time,
        "date" => Date,
        "bool" => Boolean,
        "nil" => Null
       }
    end

    def create_table(field_hash)

    end

    def verify_col_type(field_hash)
      if field_hash.keys.all? { |key| allowed_field_types.keys.include? key }

      else
        "Invalid column types specified"
      end
    end

    def self.generate_schema
      @schema = {}
      self.table_info(table_name) do |row|
        @schema[row["name"]] = row["type"]
      end

    end

  end
end