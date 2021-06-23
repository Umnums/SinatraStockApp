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
      # output[:price_change] = doc.css(".P2Luy.Ez2Ioe.ZYVHBb")
      return output
      
    end
  
  
end

