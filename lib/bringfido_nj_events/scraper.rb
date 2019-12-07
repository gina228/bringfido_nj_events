require 'pry'
require 'nokogiri'
require 'open-uri'

class BringfidoNjEvents::Scraper
  
  doc = Nokogiri::HTML(open("https://www.bringfido.com/event/state/new_jersey/"))
  
  attr_accessor :doc
  
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
    binding.pry
  end
  
  def self.scrape_events
  end
  
  def self.scrape_more_info
  end


  
end 