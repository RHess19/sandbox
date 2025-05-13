# The only false values in Ruby are:
# false
# nil
# NOT 0 or ""


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

