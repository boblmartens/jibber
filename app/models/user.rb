require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  # validates_presence_of   :password
  validates_uniqueness_of :email

  attr_accessor :password

  # receives password input from form and runs through to hash password and create salt
  def password= (pass)
    @password = pass
    self.password_salt = User.random_string(10) if !self.password_salt
    self.password_hash = User.hash_password(@password, self.password_salt)
  end

  protected
  
  # takes password and generated salt and hashes it to prepare for input into database
  def self.hash_password(pass, salt)
    Digest::SHA256.hexdigest(pass + salt)
  end

  # creates a random string of integers and letters
  def self.random_string(len)
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
  end

end
