class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, too_short: "Password must be at least 6 characters" }
  has_many :gleets
end
