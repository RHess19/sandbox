# The only false values in Ruby are:
# false
# nil
# NOT 0 or ""
# Everything but false or nil is evaluated as true


# Boolean logic
5 == 5 # true
5 != 7 # true
7 < 5 # false
5 > 7 # false
7 >= 7 # true
5 <= 5 # true

# equals
5.eql?(5.0) # false - eql? checks the type and value
5.eql?(5) # true

a = "hello"
b = "hello"
a.equal?(b) # false - checks whether they are the exact same object in memory

# spaceship operator
5 <=> 10 # -1
10 <=> 10 # 0
10 <=> 5 # 1
# -1 if left is less than right
# 0 if equal
# 1 if left greater than right



# Logical operators - &&, ||, !
# English versions - and and or - have much lower precendence and are better suited for control flow operations, not their return values
# https://graceful.dev/courses/the-freebies/modules/ruby-language/topic/episode-125-and-or/

# short circuit evaluations
# The first falsy value in && returns without evaluating further
# The first truthy value in || returns without evaluating further

!false # true


########## CONDITIONALS ############

# IF statement
if 1 < 2
    puts "1 IS less than 2!"
end

# If the block has only one line of code...
puts "1 IS less than 2... again!" if 1 < 2

if 1 < 2
    puts "here again"
elsif
    puts "oops! not true!"
else
    puts "somehow we're here now"
end


# Case statements

grade = 'F'

pass_or_not = case grade
    when 'A' then "Passed!" # when ... then used for single line blocks
    when 'D' then "Didn't pass"
    else "Something else"
end


case grade
    when 'A'
        puts "You're a genius"
        genius = true
    when 'D'
        puts "Better luck next time"
        genius = false
    else
        puts "Something else again"
        fml = true
end


# Unless statements

age = 19
unless age < 18
  puts "Get a job."
end

# Ternary operator
response = age < 18 ? "You're young" : "You're old"


# !! - two ! in a row - can be used to run a result through
# multiple boolean operators to convert a truthy/falsy value
# to an actual true or false


########## LOOPS #########

# While loop
i = 0
sum = 0
while i < 10 do
  i = i + 1
  sum = sum + i
end

puts "The sum of 0..9 is #{sum}"


# Until statement
hours_left = 12
until hours_left == 0
  if hours_left == 1
    puts "There is 1 hour left"
  else
    puts "There are #{hours_left} hours left"
  end

  hours_left -= 1
end

# For loop
for i in 0..9 do
  puts "#{i}"
end

planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter",
    "Saturn", "Uranus", "Neptune"]

for i in 0...planets.length

    puts planets[i]
end

# Each method
planets.each do |planet|
  puts planet
end

# Break
r = 0
while true
  r += 1
  if r == 22
    break
  end
end

# Next statement
num = 0
while num < 100
  num += 1
  if(num % 2 == 0)
    next # Print only odd numbers
  end

  print "#{num} "
end

# single line example
puts "You're old" unless age < 18

unless age < 18
    puts "You're old"
else
    puts "You're young"
end


# Redo statement
input = gets
while true
    if(input == "1")
      break
    end
    if(input != "1")
        puts "Invalid input"
        redo # Restarts a loop without evaluating the loop condition
    end
end