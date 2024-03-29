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
  
  # this method reads the restaurant file
  def self.read_restaurant_file
    restaurants = []
    
    # then for each restaurant in the file create an instant varible for it (Name, Cuisine and Price)
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        # create an instance from each line
        # for each line make split it apart. The atributes are separated with tabs.
        restaurants << Restaurant.new.import_line(line.chomp)
      end
      file.close
    end
    return restaurants 
  end
  
  def import_line(line)
    line_array = line.split("\t")
    
    # can you standard way to assign 
    # @name = line_array[0] ...
    # or use shift which would pull out the current element in the array
    # @name = line_array.shift 
    # but instead we'll use a shortcut and just do a triple assignment.
    @name, @cuisine, @price = line_array
    return self
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
