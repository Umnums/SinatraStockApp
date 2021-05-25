class User < ActiveRecord::Base
    has_many :portfolios
    has_many :stocks, through: :portfolios
    has_secure_password
    attr_accessor :name
end