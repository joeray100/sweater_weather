class User < ApplicationRecord
  has_secure_password
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
end
