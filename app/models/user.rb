class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  validates :username, :uniqueness => true
  validates :name, :presence => true
  validates :password, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true
  validates :description, :presence => true
  validates :city, :presence => true

  has_many :scholarships
  has_many :donations

  has_attached_file :avatar, :styles => { :mini => "30x30", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/smiley.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
