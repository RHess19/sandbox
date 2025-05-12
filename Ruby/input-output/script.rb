test_array = [1, 2, 3]

# Output - print, puts, p, putc, pp

# print - does not append a new line to the output
print "Hello world!"
print test_array # [1, 2, 3]

# puts - appends a new line to the output
# puts - attempts to convert everything to a string (see array example)
# puts - returns nil
puts "Hello world with puts!"
puts test_array # 1, 2, 3

# p - shows a more "raw" output
# p - returns the object you pass to it
p "using p!" # outputs "using p!"

# putc - put character - outputs one character at a time
putc_example = "Hello Ruby!"
putc putc_example # putc - put character - outputs one character at a time

# pp - "pretty printing" for hashes and arrays. Ruby < v2.4 needs "require 'pp'" to access this method
pp test_array
test_hash = {:name => "ryan", :lastname => "hehe"}
pp test_hash

# Input

print "Name: "
name = gets.chomp # .chomp trims separators like \n from the end. In Ruby, gets always appends a \n to the end of the user input
puts name