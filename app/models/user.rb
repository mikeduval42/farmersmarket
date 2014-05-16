require "bcrypt"
class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :is_admin, type: Mongoid::Boolean, default: false
  validates_presence_of :name, :email, :password_digest, message: "One or more of the fields was not completed, please update."

  def password
    @password
end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end
end