# Numbers

puts 1+1
puts 2-1
puts 2*2
puts 10/5
puts 2**2
puts 3**4
puts 8%2
puts 10%4


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

puts "string" == "string" # true
puts "string".object_id == "string".object_id # false
puts :symbol.object_id == :symbol.object_id # true


# Booleans - true, false, nil