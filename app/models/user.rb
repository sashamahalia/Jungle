class User < ActiveRecord::Base

  has_secure_password

  validates_length_of :password, minimum: 3
  # returns an error if password doesn't match password_confirmmation
  validates_presence_of :password_confirmation, :if => :password_digest_changed?
  validates :email, uniqueness: true
  before_validation :normalize_email

  # adapted from https://gist.github.com/flarnie/6257056
  def normalize_email
    self.email = self.email.downcase.strip
  end

end
