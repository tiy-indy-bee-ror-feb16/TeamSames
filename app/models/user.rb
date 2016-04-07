class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, too_short: "Password must be at least 6 characters" }
  has_many :gleets
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
end
