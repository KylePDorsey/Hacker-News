class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email_address, password)
    user_to_authenticate = User.find_by(email: email_address)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end
end
