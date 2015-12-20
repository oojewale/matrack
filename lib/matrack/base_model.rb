module Matrack
  class BaseModel < DataManger
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

    def self.save

    end

    def self.create(table_name, field_hash)
        conn.execute "INSERT INTO #{table_name} (#{field_hash.keys.join ","})
        VALUES (#{field_hash.values.join ","});"
    end

    def self.joined_to

    end

    def self.has_many

    end
  end
end
