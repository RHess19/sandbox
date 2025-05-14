# EACH
# EACH_WITH_INDEX
# MAP
# SELECT
# REDUCE
# BANG
# GROUP_BY

# Predicate Methods
# INCLUDE?
# ANY?
# ALL?
# NONE?


# Enumerables are methods that are built-in for both arrays and hashes

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
my_hash = { "one" => 1, "two" => 2 }
numbers = [1, 2, 3, 4, 5, 6]


########### Each - iterate through and pass each elements to a code block ##############
friends.each { |friend| puts "Hello, " + friend }
my_hash.each { |key, value| puts "#{key} is #{value}" }
# OR
my_hash.each { |pair| puts "the pair is #{pair}" }

# Multiline
friends.each do |friend|
  puts friend
  puts "second line"
end



########## each_with_index #############
friends.each_with_index { |friend, index| puts friend if index.even? }



######### map - transforms each element from an array and returns the new elements in an array ##############
friends.map { |friend| friend.upcase }


########### select - pass every item to a block and return a new array with only the items that cause the block to return true #############

friends.select { |friend| friend != 'Brian' } # Select every friend except brian
my_hash.select { |key, value| value == 1 } # Select the has pair { "one" => 1 }



########## reduce - reduce an array or hash to a single value. Often used to total items in an array or hash #########
numbers.reduce { |sum, number| sum + number }
numbers.reduce(10) { |sum, number| sum + number } # Set starting value of the accumulator to 10
# First block variable (sum) is the accumulator. Result of each iteration is stored in the accumulator and passed to the next iteration.
# Accumulator is returned at the end of the reduce method
# Accumulator's default starting value is the value of the first item in the collection

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote| # passing an argument to Hash.new() provides the default value when accessing a key that doesn't exist
  result[vote] += 1 # If this vote hasn't been seen yet, create with a value of 0. Otherwise, increment the existing value
  result # return result for the next iteration
end



############### bang methods - add ! after a method name to make it destructive - it will modify the original data instead of returning a copy of modified data ###############
### Most, but not all enumerable methods have bang versions
friends.map { |friend| friend.upcase } # returns ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
puts friends # original array is still ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase } # returns ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
puts friends # original array is now ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']



############ group by - return a hash that groups your array/hash items based on the attribute specified in the block #############
puts friends.group_by { |name| name.length } # returns {6 => ["SHARON"], 3 => ["LEO"], 5 => ["LEILA", "BRIAN"], 4 => ["ARUN"]}



################ STORING ENUMERABLE METHOD RESULTS
# Best practice is to NOT use bang methods
# 1. Store in a local variable
# 2. Wrap the enumerable method in a method definition











######### PREDICATE METHODS #########

# include? - returns true if an element exists in an array. Else, false
numbers.include?(3) # true
numbers.include?(8) # false


# any? - returns true if any elements in the array or hash match the block condition. Else, false
numbers.any? { |number| number > 3 } # true
numbers.any? { |number| number > 700 } # false


# all? - returns true if all elements in the array or hash match the block condition. Else, false
friends.all? { |friend| friend.length > 2 } # true
friends.all? { |friend| friend.length > 6 } # false


# none? - returns true if none of the elements in the array or hash return true. Else, false
friends.none? { |friend| friend.length > 2 } # false
friends.none? { |friend| friend.length > 6 } # true


# one? - returns true if exactly one element in the array or hash returns true. Else, false
friends.one? { |friend| friend == "Leo" } # true