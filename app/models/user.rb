class User < ActiveRecord::Base
  has_secure_password # this gives User model authentication mathods vis BCRYPT

  validates :email, uniqueness: { case_sensitive: false}
  validates :password, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end
