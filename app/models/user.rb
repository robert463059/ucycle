#In app/models/user.rb    has_many :authentications, :dependent => :destroy

class User < ApplicationRecord
  validates :forenames, presence: true
  validates :surname, presence: true
  has_many :authentications
  has_many :postings
  include Clearance::User
  mount_uploader :image, UserUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(forenames: auth_hash.info.forenames, email: auth_hash.info.email, password: SecureRandom.hex(5))
      user.authentications << (authentication)      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
