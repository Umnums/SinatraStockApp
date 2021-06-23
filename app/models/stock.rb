class Stock < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :portfolios, through: :stock_portfolios
    has_many :users, through: :portfolios
    
    def self.find_or_create_by_ticker(input)
        if Stock.find_by(symbol: input)
           stock = Stock.find_by(symbol: input)
           stock.update_price
           return stock
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

    def update_price
        scraper = Scraper.new
        price = scraper.scrape_stock(self.symbol)[:price].split("$")[1].to_f
        self.current_price = price
        self.save
    end

    def overall_return(purchase_price, shares)
        self.update_price
        overall_return = self.current_price * shares - (purchase_price * shares) 

    end
end
