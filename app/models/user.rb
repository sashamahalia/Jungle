class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :password
  validates_presence_of :password_confirmation, :if => :password_digest_changed?

end
