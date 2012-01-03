## Food Finder by Mike Villa
## Jan 2, 2012
#
# ruby init.rb to launch this mini program from the command line.
#
#


#
APP_ROOT = File.dirname(__FILE__)

# require "#{APP_ROOT}/lib/guide"
# require File.join(APP_ROOT, 'lib', 'guide.rb')
# require File.join(APP_ROOT, 'lib', 'guide')

# Special ruby variable that contains an array of all of the folders that ruby will look in
$:.unshift(File.join(APP_ROOT, 'lib'))
require 'guide'

guide = Guide.new('resturants.txt')
guide.launch!