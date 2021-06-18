require 'nokogiri'
require 'open-uri'
class Scraper


  
    def get_page(url)
      Nokogiri::HTML(URI.open(url))
    end
  
    def scrape_stock(symbol)
      output ={}
      doc = self.get_page("https://www.google.com/finance/quote/#{symbol}:NYSE")
      output[:name] = doc.css(".KY7mAb").text
      output[:price] = doc.css(".ln0Gqe .YMlKec").text
      output[:daily_percent] = doc.css(".enJeMd .JwB6zf")
      return output
      
    end
  
  
end

scraper = Scraper.new
print scraper.scrape_stock('RDS.A')