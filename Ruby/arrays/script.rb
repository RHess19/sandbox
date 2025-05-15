# Creating arrays

# method 1
num_array = [1, 2, 3, 4, 5]

# method 2
# Array.new() has two optional arguments - initial size and default value  - should ONLY use the second argument with an immutable object like number, boolean, or symbol. Do NOT use string, array, hash, or other
# mutable objects. See sandbox/Ruby/nested-collections/script.rb for explanation
str_array = Array.new(3, 7) # [7, 7, 7]



# Accessing elements

# Indices
num_array[0]
num_array[-2]

# #first and #last methods
num_array.first
num_array.last
num_array.first(2) # optional argument to return the first n items as an array
num_array.last(2) # optional argument to return the last n items as an array



# Adding and removing elements

# #push method - add to the end of an array and return the new array
num_array.push(6, 7) # [1, 2, 3, 4, 5, 6, 7]

# << (shovel) operator - add to the end of an array and return the new array
num_array << 8 # [1, 2, 3, 4, 5, 6, 7, 8]
num_array << 9 # [1, 2, 3, 4, 5, 6, 7, 8, 9]

# #pop method - remove last element and return the removed element
num_array.pop # 9
num_array.pop(1) # pop the last n elements. In this case, the element 8

# #shift - removes the first n elements of an array and returns those elements
num_array.shift(2) # returns [1, 2]. num_array is now [3, 4, 5, 6, 7]
num_array.shift # returns [3]. num_array is now [4, 5, 6, 7]

# #unshift - adds elements to the beginning of an array and returns that array (similar to #push)
num_array.unshift(1, 2, 3) # [1, 2, 3, 4, 5, 6, 7]


# Adding and subtracting arrays
a = [1, 2, 3]
b = [3, 4, 5]

c = a + b # [1, 2, 3, 3, 4, 5] - equivalent to a.concat(b)

d = a - b # Returns a copy of the first array, removing any elements that also appear in the second array


# Basic array methods

# empty
[].empty? # true
[[]].empty? # false
[1, 2].empty? # false

# length
[1, 2, 3].length # 3

# reverse
[1, 2, 3].reverse # [3, 2, 1]

# include
[1, 2, 3].include?(3) # true
[1, 2, 3].include?("3") # false

# join
[1, 2, 3].join # "123"
[1, 2, 3].join("-") # "1-2-3"

# map - also has an alias, #collect. They are identical. Does not modify the original array
[1, 2, 3, 4].map { |num| num**2 } # returns [1, 4, 9, 16]

# delete_at - modifies the original array
[1, 2, 3, 4].delete_at(1) # [1, 3, 4]

# #delete - deletes all instances of the provided value
[1, 2, 2, 3, 4].delete(2) # [1, 3, 4]

# #uniq - returns a new array with only unique values
[1, 1, 2, 2, 3].uniq # [1, 2, 3]

# #select - iterate over the array and return an array of any items that return true to the provided expression
nums = [1, 2, 3, 4, 5]
nums.select{ |number| number > 4 } # returns [5]

# #flatten - create a 1D array from a multi-dimensional array. non-destructive
dim_array = [1, 2, [3, 4, 5], [6, 7]]
dim_array.flatten # [1, 2, 3, 4, 5, 6, 7]

# #sort
[5, 3, 8, 2, 4, 1].sort # [1, 2, 3, 4, 5, 8]

# #product - creates cartesian product of the two arrays
[1, 2, 3].product([4, 5]) # [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]

# #sample - return a random array element
[1, 2, 3].sample

# #take - take the first n elements of an array - non-destructive
[1, 2, 3].take(2)
# OR
nums2 = [1, 2, 3]
nums2[0, 3] # get 3 elements starting at index 0
nums2[1..-1] # get characters in the range

# #size
nums2.size # 3

# #compact - remove all nil values
[1, 3, 3, 5, 5, nil].compact

# & - get elements that appear in both arrays
dup = [1, 2, 3]
dup2 = [3, 4, 5]
puts dup & dup2 # 3