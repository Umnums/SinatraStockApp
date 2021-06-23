class Stock < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :portfolios, through: :stock_portfolios
    has_many :users, through: :portfolios
    
    def self.find_or_create_by_ticker(input)
        if Stock.find_by(symbol: input)
            Stock.find_by(symbol: input).update_price
        else
            stock = Stock.create(input)
        end
    end

    def self.create(ticker)
        scraper = Scraper.new()
        output = scraper.scrape_stock(ticker)
        if output[:name] == ""
            return false
        else
            name = output[:name]
            price = output[:price].split("$")[1].to_f
            ticker = ticker.strip
            stock = Stock.new(name: name, current_price: price, symbol: ticker)
            stock.save
            return stock
        
        end

    end

    def update_price(ticker)
        scraper = Scraper.new
        price = scraper.scrape_stock(ticker)[:price].split("$")[1].to_f
        stock.current_price=price_change
    end
end
