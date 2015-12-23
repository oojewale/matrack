module Matrack
  class Queries < DataManger
    class << self

      def table_name
        self.to_s.to_snake_case + "s"
      end

      def uniq_id
        "#{self.to_s.to_snake_case}_id"
      end

      def execute(query)
        objs = []
        rows = db_conn.execute query
        rows.each{|row| objs << self.new(row.reject!{ |k| !k.is_a? String }) }
        objs
      end

      def all
        rows = execute "SELECT * FROM #{table_name}"
      end

      def find(id)
        execute("SELECT * FROM #{table_name} WHERE (#{uniq_id} = #{id})").first
      end

      def last
        offset = count - 1
        execute("SELECT * FROM #{table_name} LIMIT(1) OFFSET(#{offset})").first
      end

      def limit(num)
        execute("SELECT * FROM #{table_name} LIMIT(#{num})").first
      end

      def first
        execute("SELECT * FROM #{table_name} LIMIT(1)").first
      end

      def find_by(col, val)
        execute("SELECT * FROM #{table_name} WHERE (#{col} = '#{val}')
                LIMIT 1").first
      end

      def destroy(id)
        execute "DELETE FROM #{table_name} WHERE (#{uniq_id} = #{id})"
      end

      def destroy_all
        execute "DELETE FROM #{table_name}"
      end

      def count
        row = db_conn.execute "SELECT COUNT(*) FROM #{table_name}"
        row.hash_getter.values.first
      end

      # .update(1, title: "updated task again", done: "yes")
      def update(id, hash)
        fields = hash.map{|k,v| "'#{k}'" " = "  "'#{v}'"}.join(", ")
        qry = "UPDATE #{table_name} SET #{fields} WHERE (#{uniq_id} = #{id})"
        return "Record updated" if db_conn.execute qry
        "Operation not successful"
      end
    end

    def save
      hash = {}
      instance_variables.each{ |v| hash[v.to_s] = instance_variable_get(v) }
      attributes = hash.keys.map{ |k| k.sub("@","") }.join(", ")
      values = "#{hash.values}".gsub(/\[|\]/,"").gsub(/\"/,"'")
      query = "INSERT INTO #{self.class.table_name} (#{attributes})
              VALUES (#{values});"
      self.class.execute query
    end
  end
end