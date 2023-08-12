class User < ApplicationRecord
  before_save { self.loginID = loginID.downcase }
  validates :loginID, presence: true, length: { maximum: 51 },uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
