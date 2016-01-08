class User < ActiveManager
  property :user_id, :int, primary_key: true
  property :firstname, :str, nullable: false
  property :lastname, :str
  property :email, :str, nullable: false
  property :password, :str, nullable: false
  create_table
end