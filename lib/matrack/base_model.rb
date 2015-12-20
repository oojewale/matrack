module Matrack
  class BaseModel < DataManger
    attr_reader :table_name
    def initialize
      @table_name = self.class.to_snake_case
    end

    def self.all

    end

    def self.find()

    end

    def self.find_by()

    end

    def self.where()

    end

    def self.limit()

    end

    def self.offset()

    end

    def self.join()

    end

    def self.select()

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
  end
end
