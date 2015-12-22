module Matrack
  class Queries < DataManger
    class << self

      def table_name
        self.to_s.to_snake_case + "s"
      end

      def execute(query)
        q = []
        rows = db_conn.execute query
        rows.each{|row| q << self.new(row.reject!{ |k| !k.is_a? String }) }
        q
      end

      def all
        rows = execute "SELECT * FROM #{table_name}"
      end

      def find(id)
        execute("SELECT * FROM #{table_name} WHERE (#{self}_id = #{id})").first
      end

      def last
        offset = count.values.first - 1
        execute "SELECT * FROM #{table_name} LIMIT(1) OFFSET(#{offset})"
      end

      def limit(num)
        offset = count.values.first - 1
        execute "SELECT * FROM #{table_name} LIMIT(#{num})"
      end

      def first
        execute "SELECT * FROM #{table_name} LIMIT(1)"
      end

      def find_by(key, val)
        # Pass hash into find where the key is the attr.
        execute "SELECT * FROM #{table_name} WHERE (#{key} = #{val}) LIMIT 1"
      end

      # def where(hash)
      #   hash.map{ |k,v| "#{k} = " "#{v}" }.join(" AND ")
      # end

      # def select(*args)
      #   fields = args.join(", ")
      #   db_conn.execute "SELECT #{fields} FROM #{table_name}"
      # end

      def destroy(id)
        execute "DELETE FROM #{table_name} WHERE (#{self}_id = #{id})"
      end

      def destroy_all
        execute "DELETE FROM #{table_name}"
      end

      def count
        execute "SELECT COUNT(*) FROM #{table_name}"
      end

      def update(hash)
        # hash.map{ |k,v| "#{k} = " "#{v}" }.join(" AND ")
        # row = db_conn.execute "SELECT COUNT(*) FROM #{table_name}"
        # row.hash_getter
      end
    end
  end
end