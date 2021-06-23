class Portfolio < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :stocks, through: :stock_portfolios
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :starting, presence: true
    serialize :history

    def yield
        ((self.starting - self.current)/self.starting) * 100 
    end

    def cost_basis(original_price, original_shares, new_price, new_shares)
        basis = (original_price * original_shares + new_price * new_shares)/(original_shares + new_shares)
        return basis
    end
     

end