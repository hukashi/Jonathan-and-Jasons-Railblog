class User < ActiveRecord::Base
  has_many :posts
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: 8..20

end
