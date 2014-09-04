class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :name, :profile, :password_confirmation, :password, :role, :background_image

  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def role?(role_to_compare)
      self.role.to_s == role_to_compare.to_s
  end

  has_many :tracks
  has_many :comments, dependent: :destroy
  
  ROLES = %w[artist listener]
  IMAGES = Dir.entries("#{Rails.root}/app/assets/images/background_images/").map { |f| f if !File.directory?(f) }.compact!

  def role_symbols
     [role.to_sym]
  end


end