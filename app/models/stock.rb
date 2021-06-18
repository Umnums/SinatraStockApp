class Stock < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :portfolios, through: :stock_portfolios
    has_many :users, through: :portfolios
    
    def self.find_or_create_by_ticker(input)
        if Stock.find_by(symbol: input)
            Stock.find_by(symbol: input)
        else
            stock = Stock.create(ticker)
        end
    end

    def self.create(ticker)
        scraper = Scraper.new()
        output = scraper.scrape_stock(ticker)
        if output[:name]
            stock = Stock.new(name: output[:name], current_price: output[:price].to_i, symbol:[ticker.strip])
            stock.save
            return stock
        else
            "No stock found by that symbol"
        end

    end
end
