class User < ActiveRecord::Base
    has_many :portfolios
    has_many :stocks, through: :portfolios
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :username, uniqueness: true

end