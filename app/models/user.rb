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

  def self.authenticate(username, password)
    p username
    p password
    user_to_authenticate = User.find_by(username: username)
    p user_to_authenticate
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end
end
