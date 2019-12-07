require 'open-uri'
require 'nokogiri'

class BringfidoNjEvents::CLI
  
  @@all = []
  
  def start 
    puts "Hello, and welcome to the Bring Fido NJ Events gem!"
    binding.pry
    #events = scrape events
    events.each {|event| @@all << event}
    self.list_events
    self.menu
  end 
  
  def self.all
    @@all 
  end 
  
  def self.list_events
    puts "Below is a list of upcoming dog-related activities and events in New Jersey"
    #events = BringfidoNjEvents::Scraper
    all.each_with_index(1) do |event, index|
      puts "#{index}. #{event.name}: #{event.time} - #{event.location}"
    end
  end
  
  def self.menu
    puts "Type in the number that corresponds with the event to get more information"
    input = gets.strip
    index = input.to_i - 1
    if index > 0 && index < @@all.size
    end
  
  
    #bringfido url is event.url
    #check input is number
    
    #check input is in range / valid 
    #scrape @@all[input-1].url
  end
  
end