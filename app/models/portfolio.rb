class Portfolio < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :stocks, through: :stock_portfolios
    belongs_to :user
    attr_accessor :description

end