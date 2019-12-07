require 'nokogiri'
require 'open-uri'

class BringfidoNjEvents::Scraper
  
  Nokogiri::HTML(open("https://www.bringfido.com/event/state/new_jersey/"))
  
end 