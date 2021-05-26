class Portfolio < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :stocks, through: :stock_portfolios
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :starting, presence: true
     

end