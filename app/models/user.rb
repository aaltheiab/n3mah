# This is the user model which handles the authentication as simple as possible.
# For better Secure authentication include the device gem
class User < ActiveRecord::Base

  validates :phone_number, :password, presence: true


  def hash_password(password)
    self.password = BCrypt::Password.create(password).to_s
  end


  def valid_password?(password, hash)
    BCrypt::Password.new(hash) == password
  end
end