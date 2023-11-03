class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
