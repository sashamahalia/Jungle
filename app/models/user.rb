class User < ActiveRecord::Base

  has_secure_password

  # returns an error if password doesn't match password_confirmmation
  validates_presence_of :password_confirmation, :if => :password_digest_changed?

end
