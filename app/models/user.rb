class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_confirmation

  before_create :create_key

  def create_key
    self.api_key = SecureRandom.hex
  end
end
