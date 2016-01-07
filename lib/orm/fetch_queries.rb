module Matrack
  class FetchQueries < DataManger
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

      # firstname: "name", lastname: "last"
      def find_cols(col_hash)
        clause = col_hash.map{|k,v| "#{k.to_s} = " "'#{v}'"}.join(" AND ")
        execute("SELECT * FROM #{table_name} WHERE (#{clause})
                LIMIT 1").first

      end
    end
  end
end