require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessor :password

  def password= (pass)
    @password = pass
    self.password_salt = User.random_string(10) if !self.password_salt
    self.password_hash = User.hash_password(@password, self.password_salt)
  end

  protected
    
  def self.hash_password(pass, salt)
    Digest::SHA256.hexdigest(pass + salt)
  end

  def self.random_string(len)
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
  end

end
