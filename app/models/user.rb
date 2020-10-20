class User < ActiveRecord::Base
  has_secure_password # this gives User model authentication mathods vis BCRYPT

  validates :email, uniqueness: { case_sensitive: false}
  validates :password, length: {minimum: 6}
  before_save :normalize_email

  def normalize_email
    self.email = self.email.downcase.strip
  end

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end
