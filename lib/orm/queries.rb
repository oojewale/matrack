module Matrack
  class Queries < FetchQueries
    class << self
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
      end
    end

    def save
      hash = insert_hash
      attributes = hash.keys.map{ |k| k.sub("@","") }.join(", ")
      values = "#{hash.values}".gsub(/\[|\]/,"").gsub(/\"/,"'")
      query = "INSERT INTO #{self.class.table_name} (#{attributes})
              VALUES (#{values});"
      self.class.execute query
    end

    def insert_hash
      hash = {}
      instance_variables.each do |v|
        var = v.to_s
        if var == "@password"
          hash[var] = self.class.password_hash(instance_variable_get(v))
        else
          hash[var] = instance_variable_get(v)
        end
      end
      hash
    end
  end
end