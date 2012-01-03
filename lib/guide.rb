## Food Finder by Mike Villa
## Jan 2, 2012
#
# guide.rb will play the role of the controller 
#
#

# Load in this dependancy
require 'restaurant'

class Guide

  def initialize(path=nil)
    # locate the resturant text file at that path
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file."
    # exit if create fails  
    elsif Restaurant.create_file 
      puts "Created restaurant file."
    # exit if create fails
    else
      puts "Exiting.\n\n"
      exit!  
    end
  end  

  def launch!
    introduction
    
    result = nil
    # action loop
    until result == :quit
      # what do you want to do? (list, find, add, quit)
      print "> "
      user_response = gets.chomp # whatever the user_response get it and chomp off the \n
      # do the action
      result = do_action(user_response)
      # repeat until the user quits
    end    
    conclusion
  end
  
  
  def do_action(action)
    # actions are list, find, add, quit 
    case action 
      when 'list'
        puts "Listing..."
      when 'find'
        puts "Finding..."
      when 'add'
        puts "Adding..."
      when 'quit'
        return :quit
      else
        puts "Command not found. Available options are list, add, find and quit \n"  
    end
  end
  

  def introduction
    puts "\n\n[This is the Food Finder Application]\n\n"
    puts "This program will suggestion some popular food places for you depending on the food you are currently craving.\n\n"
  end  


  def conclusion
    puts "\n [Goodbye and Bon Appetit!!]\n\n\n"
  end

end