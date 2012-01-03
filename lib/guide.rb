## Food Finder by Mike Villa
## Jan 2, 2012
#
# guide.rb will play the role of the controller 
#
#

# Load in this dependancy
require 'restaurant'

class Guide
  
  class Config
    @@actions = ['list','find', 'add', 'quit']
    def self.actions; @@actions; end # return all of the valid actions
  end

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
    # action loop which we repeat until the user quits
    until result == :quit
      action = get_action
      result = do_action(action)
    end    
    conclusion
  end
  
  
  def get_action
    # what do you want to do? (list, find, add, quit)
    # initialize action    
    action = nil
    
    # continuously ask the user for action until we get a valid one
    until Guide::Config.actions.include?(action)
      if !action.nil? 
        puts "Actions Mike: " +  Guide::Config.actions.join(", ")
      end
      print "> "
      user_response = gets.chomp # whatever the user_response get it and chomp off the \n     
      action = user_response.downcase.strip # make all lowercase and take out whitespace
    end
    return action
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
        add_restaurant
      when 'quit'
        return :quit
      else
        puts "Command not found, see available actions.\n"  
    end
  end
  
  def add_restaurant    
    puts "\nAdd Restaurant\n".upcase
    
    restaurant = Restaurant.build_using_questions
    
    if restaurant.save
      puts "\nRestaurant Added Successfully\n"
    else
      puts "\nSave Error: Restaurant Not Added\n\n"
    end
    
  end

  def introduction
    puts "[This is the Food Finder Application]\n\n"
    puts "This program will suggestion some popular food places for you depending on the food you are currently craving.\n\n"
  end  


  def conclusion
    puts "\n [Goodbye and Bon Appetit!!]\n\n\n"
  end

end