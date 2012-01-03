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
    if Restaurant.file_exists?
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
    # action loop
    #   what do you want to do
    #   do that action
    # repeat until user quits
    conclusion
  end

  def introduction
    puts "\n\n[This is the Food Finder Application]\n\n"
    puts "This program will suggestion some popular food places for you depending on the food you are currently craving.\n\n"
  end  


  def conclusion
    puts "\n [Goodbye and Bon Appetit!!]\n\n\n"
  end

end