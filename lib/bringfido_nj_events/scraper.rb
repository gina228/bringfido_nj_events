require 'pry'
require 'nokogiri'
require 'open-uri'

class BringfidoNjEvents::Scraper
  
  doc = Nokogiri::HTML(open("https://www.bringfido.com/event/state/new_jersey/"))
  binding.pry
  
end 