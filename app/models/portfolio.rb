class Portfolio < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :stocks, through: :stock_portfolios
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :starting, presence: true
    serialize :history

    def total
        total_stock_value = 0
        self.history.values.each do |value|
            total_stock_value += value[:purchase_price] * value[:shares]
            binding.pry
            
        end
        return total_stock_value + self.current
    end

    def yield
        ((self.total - self.starting)/self.starting) * 100 
    end

    def cost_basis(original_price, original_shares, new_price, new_shares)
        basis = (original_price * original_shares + new_price * new_shares)/(original_shares + new_shares)
        return basis
    end
     

end