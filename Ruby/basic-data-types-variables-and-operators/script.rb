# Numbers

puts 1+1
puts 2-1
puts 2*2
puts 10/5
puts 2**2
puts 3**4

# Remainder and modulo
# modulo returns + when the second operand is +, - when the second operand is -
# remainder returns + when the first operand is +, - when the first operand is -
puts 8%2 # 0
puts 10%4 # 2

puts 16.remainder(5) # 1
puts 16.divmod(5) # [3, 1]


# Integers and floats

# Math operations on two integers will ALWAYS result in an integer
puts 17/5 # 3, not 3.4

puts 17/5.0 # 3.4 - replace one number with a float to get a float as an answer

# Integer to float
puts 13.to_f

# Float to integer (does not round - truncates at the decimal)
puts 13.9.to_i # 13

# Even and odd
puts 6.even?
puts 7.even?

puts 6.odd?
puts 7.odd?


# Strings - "" or ''. String interpolation and escape characters only work in ""

# Concatenation
puts "Welcome " + "to " + "this " + "practice!"
puts "Welcome " << "to " << "This " + "practice!"
puts "Welcome ".concat("to ").concat("this ").concat("practice!");

# Substrings
puts "hello"[0] # h
puts "hello"[0..1] # he
puts "hello"[0, 4] # hell
puts "hello"[-1] # o

# Escape characters - \\ \b \r \n \s \t \" \'
puts "Escape\ncharacterr\ntest!"

# Interpolation - evaluate a string that contains placeholder variables
name = "Ryan"
puts "Hello, #{name}"
puts 'Hello, #{name}'

# Common string methods
puts "hello".capitalize
puts "hello".include?("lo") # true
puts "hello".include?("z") # false
puts "hello".upcase
puts "hello".downcase
puts "hello".empty? # false
puts "".empty? # true
puts "hello".length
puts "hello".reverse
puts "hello world".split # ["hello", "world"]
puts "hello".split("") # ["h", "e", "l", "l", "o"]
puts " hello, world   ".strip # "hello, world"
puts "he77o".sub("7", "l") # "hel7o"
puts "he77o".gsub("7", "1") # "hello"
puts "hello".insert(-1, " dude") # "hello dude"
puts "hello world".delete("l") # "heo word"
puts "!".prepend("hello, ", "world") # "hello, world!"

# Convert to string
5.to_s
nil.to_s
:symbol.to_s


# Symbols - stored in memory only once, even if a duplicate value symbol already exists. With strings, even if an existing string with that value exists, it occupies a separate memory spot
# Create symbol with : followed by the symbol name
# Symbol names don't have to be valid variable names if placed within quotes. Ex. :"this is a valid symbol"

puts "string" == "string" # true
puts "string".object_id == "string".object_id # false
puts :symbol.object_id == :symbol.object_id # true


# Booleans - true, false, nil

# test for nil
puts "Hello".nil? # false
puts false == nil # false


# Arrays and hashes
test_array = [1, 2, 3, 4, 5]
puts test_array[1] # 2

# hashes are also called dictionaries
test_hash = {:dog => 'barks', :cat => 'meows', :pig => 'oinks'}
puts test_hash[:cat]

# new hash syntax - only works when using symbols as keys
test_hash2 = {dog: 'barks', cat: 'meows', pig: 'oinks'}
puts test_hash2[:dog] # must still put a : before the key when accessing items


# Get user input
puts "Name: "
name = gets.chomp # prompt user for input, then use .chomp to remove escape characters at the end (like the newline entered by hitting enter at the command line)
puts name

# Constants
MY_CONSTANT = "constant" # all upppercase denotes a constant. Can be changed, but will throw a warning

# Global variables
$global_variable = "global" # SHOULD NOT USE

# Class variables - accessible by instances of a class as well as the class itself
# @@instances = 0

# Instance variables - accessible by the current instance of the parent class
# @var = "instance"


# In-place operations
quiet = "hello there"
loud = quiet.upcase

puts loud # HELLO THERE
puts quiet # hello there

# In place operations modify the original object
quiet2 = "hello there"
loud2 = quiet2.upcase!

puts loud2 # HELLO THERE
puts quiet2 # HELLO THERE

# string concatenation in-place
tom = "kitty"
jerry = tom

tom << "kat"

puts tom # kittykat
puts jerry # kittykat