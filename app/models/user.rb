class User < ActiveRecord::Base

  attr_accessor :authenticate_with_credentials

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

  def self.authenticate_with_credentials email, password
    normalized_email = email.downcase.strip
    user = User.find_by(email: normalized_email)
    if (user.authenticate(password))
      return user
    end
    nil
  end

end
