## Food Finder by Mike Villa
## Jan 2, 2012
#
# guide.rb will play the role of the controller 
#
#

class Guide

  def initialize(path=nil)
    # locate the resturant text file at that path
    # or create a new file
    # exit if create fails
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