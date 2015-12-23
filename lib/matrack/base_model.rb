module Matrack
  class BaseModel < Queries

    def initialize(hash = {})
      hash.each_pair { |k,v| send("#{k}=", v) }
      self
    end

    @@query_string = ""

    class << self

      def create_table
        query_string = @@query_string.sub(/,[\s]$/,"")
        create_table_fields(table_name,query_string)
        @@query_string = ""
      end

      def property(name, type = "str", desc = {} )
        field_hash = { name => type }
        if verify_col_type(field_hash) == true
          db_str = DataUtility.type_mapper(field_hash)
          @@query_string += query_builder(db_str.keys, db_str.values,                              desc)
          @@query_string += ", " unless @@query_string == ""
          get_and_set_property(name)
        else
          puts db_error(verify_col_type(field_hash))
          exit
        end
      end

      def get_and_set_property(name)
        define_method(name) do
         instance_variable_get("@#{name}")
        end
        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", "#{value}")
        end
      end

      def create(field_hash)
        attributes = "#{field_hash.keys}".gsub(/:/, "").gsub(/\[|\]/,"")
        values = "#{field_hash.values}".gsub(/\[|\]/,"").gsub(/\"/,"'")
        db_conn.execute "INSERT INTO #{table_name} (#{attributes}) VALUES (#{
          values});"
      end
    end
  end
end
