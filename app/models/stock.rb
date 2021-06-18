class Stock < ActiveRecord::Base
    has_many :stock_portfolios
    has_many :portfolios, through: :stock_portfolios
    has_many :users, through: :portfolios
    
    def find_or_create_by_ticker(input)
        if Stock.find_by(ticker: input)
            Stock.find_by(ticker: input)
        else
            stock = Stock.create(ticker)
        end
        

        
    end

    def create(ticker)
        scraper = Scraper.new()
        output = scraper.scrape_stock(ticker)
        if output[:name]
            stock = Stock.new(name: output[:name], price: output[:price], ticker:[ticker])
        else
            "No stock found by that ticker"
        end

    end
end
