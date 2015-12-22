module Matrack
  class BaseModel < DataManger

    @@create_query_string = ""

    def initialize
      @attr = attr
    end

    class << self
      def table_name
        self.to_s.to_snake_case + "s"
      end

      def create_table
        create_table_feilds(table_name, @@create_query_string)
      end

      def property(name, type = "str", primary = {}, nullable = {} )
        field_hash = { name => type }
        if verify_col_type(field_hash) == true
          db_str = DataUtility.type_mapper(field_hash)
          @@create_query_string += query_builder(db_str.keys, db_str.values,                                    primary, nullable)
          require "pry"; binding.pry
        else
          puts db_error(verify_col_type(field_hash))
        end
      end

      def all
        conn.execute "SELECT * FROM #{table_name}"
      end

      def find(id)
        conn.execute "SELECT * FROM #{table_name} WHERE (id = #{id})"
      end

      def find_by(key, val)
          # Pass hash into find where the key is the attr.
          conn.execute "SELECT * FROM #{table_name} WHERE (#{key} = #{val}) LIMIT 1"
      end

      def where(hash)
          hash.map{ |k,v| "#{k} = " "#{v}" }.join(" AND ")
      end

      def limit()

      end

      def offset()

      end

      def join()

      end

      def select(*args)
        fields = args.join(", ")
        conn.execute "SELECT #{fields} FROM #{table_name}"
      end

      def unique()

      end

      def count
        conn.execute "SELECT COUNT(*) FROM #{table_name}"
      end

      def create(field_hash)
        conn.execute "INSERT INTO #{table_name} (#{field_hash.keys.join ","})
        VALUES (#{field_hash.values.join ","});"
      end
    end
    private


  end
end
