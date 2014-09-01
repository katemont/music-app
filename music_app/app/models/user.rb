class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :profile, :password_confirmation, :password

  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

end