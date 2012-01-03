## Food Finder by Mike Villa
## Jan 2, 2012
#
#
#

class Restaurant
  
  @@filepath = nil
  
  # need to create this setter method in order to all @@filepath to be accessible from outside of the class
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
    
  
  def self.file_exists?
    # determines if the restaurant file exists
  end
  
  def self.create_file
    # this method creates the restaurant file
  end
  
  def self.saved_restaurants
    # this method reads the restaurant file
    # then for each restaurant in the file create an instant varible for it (Name, Cuisine and Price)
    
  end

end
