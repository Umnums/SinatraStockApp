class Stock < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :portfolios, through: :stock_portfolios
    has_many :users, through: :portfolios
end