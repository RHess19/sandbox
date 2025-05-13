# Creating hashes

# method 1
my_hash = {
    "random word" => "ahoy",
    "my test score" => 92,
    "an array" => [1, 2, 3],
    "another hash, but empty" => {},
    9 => "nine",
    :six => 6
}

# method 2
another_hash = Hash.new


# Accessing values
my_hash["random word"] # returns "ahoy"
my_hash["this key doesn't exist"] # returns "nil"
my_hash.fetch("also doesn't exist") # using #fetch will avoid program-breaking behavior and throw an error instead of returning nil
my_hash.fetch("still doesn't exist", "key not found") # you can optionally supply a default value to return if the key isn't found


# Adding and changing data

# Add a new key-value pair
my_hash["here's a new key"] = "Wow!"

# Change an existing value
my_hash["random word"] = "New"


# Removing data - #delete
my_hash.delete(9) # returns the value of the deleted key, "nine"


# Hash methods
# Hashes have many methods in common with arrays since they both use Ruby's Enumerable module

# Return keys and values as arrays
my_hash.keys
my_hash.values

# Iterate over keys or values
my_hash.each_key { |key| puts key}
my_hash.each_value { |value| puts value}

# Merge two hashes - the values of the hash passed to the merge method overwrite any duplicate key values in the hash
# calling the merge method
hash1 = {"a" => 100, "b" => 200}
hash2 = {"b" => 254, "c" => 300}
hash1.merge(hash2) # {"a" => 100, "b" => 254, "c" => 300}

# #key? - test if a key exists in the hash
puts my_hash.key?(:six) # true

# #value? - test if a value exists in the hash
puts my_hash.value?(:six) # false

# #select - pass a block and return any key-value pair that returns true from the block
my_hash.select{|key, value| key == :six}

# #fetch - return a key's value if it exists. Optionally, include a second parameter - a default value to return if the key doesn't exist
my_hash.fetch("an array") # returns [1, 2, 3]
my_hash.fetch("This key doesn't exist", "Key not found") # Returns "Key not found"

# #to_a - returns an array of a hash - non-destructive
my_hash.to_a


# Symbols as hash keys
# Much more common in real programs because symbols perform better and provide cleaner syntax

# rocket syntax
american_cars = {
    :chevrolet => "Corvette",
    :ford => "Mustang",
    :dodge => "Ram"
}

# symbols syntax - only works when using symbols for keys
japanese_cars = {
    honda: "Accord",
    toyota: "Corolla",
    nissan: "Altima"
}


# Iterating over hashes
japanese_cars.each do |key, value|
  puts "Make: #{key}\nModel: #{value}\n\n"
end