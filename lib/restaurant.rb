## Food Finder by Mike Villa
## Jan 2, 2012
#
#
#

class Restaurant
  
  @@filepath = nil

  attr_accessor :name, :cuisine, :price
  
  # need to create this setter method in order to all @@filepath to be accessible from outside of the class
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
    
  def self.file_exists?
    # determines if the restaurant file exists and that the class varible @@filepath has been set
    if @@filepath && File.exists?(@@filepath) 
      return true
    else 
      return false
    end
  end
  
  def self.file_usable?
    # another of checking besides using a if then or case statment.
    # see if the filepath is set, exists on the file system, readable and is writable.
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end
  
  def self.create_file
    # this method creates the restaurant file
    # create a file unless the file already exists
    # return that the file is usable
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
  end
  
  def self.saved_restaurants
    # this method reads the restaurant file
    # then for each restaurant in the file create an instant varible for it (Name, Cuisine and Price)
    
  end

  def self.build_using_questions
    args = {}
    print "Name: "
    args[:name] = gets.chomp.strip

    print "Cuisine: "
    args[:cuisine] = gets.chomp.strip

    print "Price: "
    args[:price] = gets.chomp.strip
    
    return self.new(args)
  end

  # instance methods
  def initialize(args={})
    @name     = args[:name]     || ""
    @cuisine  = args[:cuisine]  || ""
    @price    = args[:price]    || ""
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end


end
