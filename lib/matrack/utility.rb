class ::String
  def to_snake_case
    gsub("::", "/").
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').tr("-", "_").downcase
  end

  def to_camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split("_").map(&:capitalize).join
  end

  def to_b
    return true if !self.nil? && (self == true || downcase == "true")
    return false if self.nil? || downcase == "false" || self == false
    false
  end

  def titleize
    split.map!(&:capitalize).join(" ")
  end
end

class ::Array
  def hash_getter
    first.select{|k| k.is_a? String}
  end
end
