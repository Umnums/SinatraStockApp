require 'nokogiri'
require 'open-uri'
class Scraper


  
    def get_page(url)
      Nokogiri::HTML(open(url))
    end
  
    def scrape_stock(symbol)
      output ={}
      doc = self.get_page("https://www.google.com/finance/quote/#{symbol}:NYSE")
      output["name"] = doc.css(".KY7mAb").text
      output["price"] = doc.css(".ln0Gqe .YMlKec.fxKbKc").text
      return output

    end
  
    def scrape_city(city_url)
      doc = self.get_page(city_url)
      games = doc.css(".content_box")
      games
    end
  
end
scraper = Scraper.new
print scraper.scrape_stock("F")["name"]
print scraper.scrape_stock("F")['price']
