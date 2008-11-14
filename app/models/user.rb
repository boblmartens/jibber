require 'digest/sha2'

class User < ActiveRecord::Base
  def password()
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash = salt, Digest::SHA256.hexdigest(params[:password] + salt)
  end

end
