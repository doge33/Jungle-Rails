class User < ActiveRecord::Base
  has_secure_password # this gives User model authentication mathods vis BCRYPT
end
