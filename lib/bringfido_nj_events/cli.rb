require 'open-uri'
require 'nokogiri'

class BringfidoNjEvents::CLI
  
  attr_accessor :name, :date, :location, :url
  
  @@all = []
  
  def start 
    puts "Hello, and welcome to the Bring Fido NJ Events gem!"
       how_many
       list_events 
       menu
    end

    def how_many
       puts "There are many pet-related events over the next year, how many would you like to see?"
       puts "Enter a number from 1-100"
       input = gets.strip.to_i
       if input > 0 && input < 100
        BringfidoNjEvents::Scraper.new("").scrape_events(input)
       else
            how_many
       end
    end
    def list_events 
        @events = BringfidoNjEvents::Events.all
        puts "Here are the upcoming events in New Jersey:"
        @events.each.with_index(1) do |event, index| 
            puts "#{index} " + "#{event.name}", + "#{event.location}"
        end
    end

    def menu
        puts "Select an event by typing the associated number to get more information about that event or type exit to quit:"
        input = gets.strip
        if input.class == String
            if input.downcase == "exit"
                quit 
            end
        end

        index = input.to_i - 1
        wrong_input = "I'm not sure I understand. Please try again."
        if index >= 0 && index < @events.size
            selected_event = @events[index]
            puts "#{selected_event.name}"
            if !selected_event.description 
                more_info = BringfidoNjEvents::Scraper.new("#{selected_event.website}").scrape_more_info
                selected_event.add_info(more_info)
            end
            puts "Description:" + "#{selected_event.description}", "Location:" + "#{selected_event.location}", "Website" + "#{selected_event.website}" 

            while true 
                puts "Type list to display the original list again, or exit to quit" 
                input = gets.strip
                if input.class == String
                    if input.downcase == "list"
                        list_events
                        menu
                    elsif input.downcase == "exit"
                        quit
                    else
                        puts "#{wrong_input}"
                    end
                end
            end
        else 
            puts "#{wrong_input}"
            menu
        end
    end

    def quit 
        exit!
    end
end