module Matrack
  class BaseModel < DataManger
    attr_reader :create_query_string

    @@query_string = ""

    class << self
      def table_name
        self.to_s.to_snake_case + "s"
      end

      def create_table
        query_string = @@query_string.sub(/,[\s]$/,"")
        create_table_feilds(table_name,query_string)
        @@query_string = ""
      end

      def property(name, type = "str", primary = {}, nullable = {} )
        field_hash = { name => type }
        if verify_col_type(field_hash) == true
          db_str = DataUtility.type_mapper(field_hash)
          @@query_string += query_builder(db_str.keys, db_str.values,                                    primary, nullable)
          @@query_string += ", " unless @@query_string == ""
          get_and_set_property(name)
        else
          puts db_error(verify_col_type(field_hash))
          exit
        end
      end

      def get_and_set_property(name)
        # instance_variable_set("@#{name},#{value}")

        # define_method(name) do
        #   a = instance_variable_get("@#{name}")
        # end
      end

      def all
        db_conn.execute "SELECT * FROM #{table_name}"
      end

      def find(id)
        row = db_conn.execute "SELECT * FROM #{table_name} WHERE (#{self}_id = #{id})"
        row.hash_getter
      end

      def last
        offset = count.values.first - 1
        row = db_conn.execute "SELECT * FROM #{table_name} LIMIT(1) OFFSET(#{offset})"
        row.hash_getter
      end

      def first
        row = db_conn.execute "SELECT * FROM #{table_name} LIMIT(1)"
        row.hash_getter
      end

      def find_by(key, val)
        # Pass hash into find where the key is the attr.
        row = db_conn.execute "SELECT * FROM #{table_name} WHERE (#{key} = #{val}) LIMIT 1"
        row.hash_getter
      end

      def where(hash)
          hash.map{ |k,v| "#{k} = " "#{v}" }.join(" AND ")
      end

      def select(*args)
        fields = args.join(", ")
        db_conn.execute "SELECT #{fields} FROM #{table_name}"
      end

      def destroy(id)
        db_conn.execute "DELETE FROM #{table_name} WHERE (#{self}_id = #{id})"
      end

      def destroy_all
        db_conn.execute "DELETE FROM #{table_name}"
      end

      def count
        row = db_conn.execute "SELECT COUNT(*) FROM #{table_name}"
        row.hash_getter
      end

      def create(field_hash)
        attributes = "#{field_hash.keys}".gsub(/:/, "").gsub(/\[|\]/,"")
        values = "#{field_hash.values}".gsub(/\[|\]/,"").gsub(/\"/,"'")
        db_conn.execute "INSERT INTO #{table_name} (#{attributes}) VALUES (#{
          values});"
      end
    end
    private


  end
end
