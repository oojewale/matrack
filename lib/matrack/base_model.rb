module Matrack
  class BaseModel < DataManger

    def initialize
      @table_name = self.class.to_snake_case + "s"
    end

    def create_table
      create_table(table_name, field_hash)
    end

    def self.all
      conn.execute "SELECT * FROM #{table_name}"
    end

    def self.find(id)
      conn.execute "SELECT * FROM #{table_name} WHERE (id = #{id})"
    end

    def self.find_by(key, val)
        # Pass hash into find where the key is the attr.
        conn.execute "SELECT * FROM #{table_name} WHERE (#{key} = #{val}) LIMIT 1"
    end

    def self.where(hash)
        hash.map{ |k,v| "#{k} = " "#{v}" }.join(" AND ")
    end

    def self.limit()

    end

    def self.offset()

    end

    def self.join()

    end

    def self.select(*args)
      fields = args.join(", ")
      conn.execute "SELECT #{fields} FROM #{table_name}"
    end

    def self.unique()

    end

    def self.count
      conn.execute "SELECT COUNT(*) FROM #{table_name}"
    end

    def self.create(field_hash)
      conn.execute "INSERT INTO #{table_name} (#{field_hash.keys.join ","})
      VALUES (#{field_hash.values.join ","});"
    end

    def self.joined_to

    end

    def self.has_many

    end

    private

    attr_reader :table_name
  end
end
