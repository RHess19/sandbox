# ARRAYS
# 
# Creating a new nested array
# Accessing elements
# # Accessing non-existant elements
# Adding and removing elements
# Iterating over a nested array
# 
#
# HASHES
# 
# Nested hashes
# Accessing data
# Adding and removing data
# Methods
# 
#
#
#
# Arrays for testing
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]




###################### Creating a new nested array #########################

# Do NOT use this method!!!!
mutable = Array.new(3, Array.new(2)) # [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
p mutable # [[1000, nil], [1000, nil], [1000, nil]] # The assignment above changes all sub-arrays because using a mutable value for the second argument above makes each default value in the array a REFERENCE to the same default value

# USE this method
immutable = Array.new(3) { Array.new(2) } # [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
p mutable # [[1000, nil], [nil, nil], [nil, nil]]


##################### Accessing elements ################################
teacher_mailboxes[0][0] # "Adams"
teacher_mailboxes[1][0] # "Jones"
teacher_mailboxes[2][0] # "Perez
teacher_mailboxes[0][-1] # "Davis"
teacher_mailboxes[-1][0] # "Perez"
teacher_mailboxes[-1][-2] # "Smith"

# Accessing non-existant elements
teacher_mailboxes[3][0] # NoMethodError because the returned 'nil' class does not have a method []
teacher_mailboxes[0][4] # returns 'nil'

# Use #dig when trying to access non-existant elements
teacher_mailboxes.dig(3, 0) # returns 'nil'
teacher_mailboxes.dig(0, 4) # returns 'nil'



############# Adding and removing elements ###############
test_scores << [100, 99, 98, 97]
test_scores[0].push(100)
p test_scores

test_scores.pop
test_scores[0].pop
p test_scores



############# Iterating over a nested array ##############
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row: #{row_index} = #{row}"
end

teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row: #{row_index} Column: #{column_index} = #{teacher}"
  end
end

# If all you need is each item and the row/column doesn't matter, use #flatten
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher}"
end

# Use nested arrays and nested predicate enumerables
# Determine if any student scored higher than 80 on everythin
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end # false



############# Nested hashes ###############
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}



############# Accessing data ##############
# hash[:x][:y] - :x is key of the hash, :y is key of the nested hash
vehicles[:alice][:year] # 2019
vehicles[:blake][:make] # "Volkswagen"
vehicles[:caleb][:model] # "Accord"

# Use #dig when trying to access non-existant elements
vehicles[:zoe][:year] # NoMethodError because the returned 'nil' class does not have a method []
vehicles[:alice][:color] # returns 'nil'

vehicles.dig(:zoe, :year) # returns 'nil'
vehicles.dig(:alice, :color) # returns 'nil'



########### Adding and removing data #############
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"} # Add new entry to the vehicles hash
vehicles[:dave][:color] = "red" # Add new entry to the nested hash under vehicles[:dave]

vehicles.delete(:blake) # Delete the hash's entry for :blake
vehicles[:dave].delete(:color) # Delete the entry for :color under the nested hash for :dave



############### METHODS ################

# Return all owners of vehicles newer than 2020

p vehicles.map { |name, data| name if data[:year] >= 2020 }.compact # #compact returns an array or hash without 'nil' values

# #filter_map combines #map and #compact
vehicles.filter_map{ |name, data| name if data[:year] >= 2020 }