require "sqlite3"

module Matrack
  class DataManger

    class << self

      def db_conn
        db = SQLite3::Database.new "#{APP_PATH}/db/app.sqlite3"
        db.results_as_hash = true
        db
      end

      def db_error(message)
        DataUtility.db_error(message)
      end

      def query_builder(name, type, desc)
        name = name.join
        type = type.join
        primary_key = "PRIMARY KEY" if desc[:primary_key] == true
        primary_key += " AUTOINCREMENT" if desc[:primary_key] == true &&
                                           type == "INTEGER"
        primary_key = primary_key ? primary_key : ""
        null_value = desc[:nullable].nil? ? "NULL" : "NOT NULL"
        null_value = "NOT NULL" if desc[:primary_key] == true
        "#{name} #{type} #{primary_key} #{null_value}"
      end

      def allowed_field_types
        ["int", "str", "time", "date"]
      end

      def create_table_fields(table_name, qry_str)
        begin
          db_conn.execute "CREATE TABLE IF NOT EXISTS #{table_name} (#{qry_str});"
        rescue SQLite3::Exception => exp
          puts self.db_error(exp)
          exit
        end
      end

      def verify_col_type(field_hash)
        return true if valid_col_types?(field_hash)
        "Invalid column type(s) specified"
      end

      def valid_col_types?(field_hash)
        field_hash.values.all? { |val| allowed_field_types.include? val.to_s }
      end
    end
  end
end