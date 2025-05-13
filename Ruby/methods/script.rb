# Creating a method
def my_name
  return "Ryan H" # explicit return
end

puts my_name


# Parameters and arguments
def greet(name)
  "Hello, " + name + "!" # implicit return - Ruby methods return the last expression that was evaluated if no other expression is preceded by the 'return' keyword
end

puts greet("John")

# Parentheses with method calls are not mandatory
puts greet "John"


# Default parameters
def greet_again(name = "stranger")
  return "Hello, " + name + "!"
end

puts greet_again # or puts greet_again()


# Chaining methods
phrase = ["be", "to", "not", "or", "be", "to"]
puts phrase.reverse.join(" ").capitalize


# Predicate methods - #method? - returns true or false
# CONVENTION: When creating your own methods, put ? at the end of the method name to indicate it returns a boolean
# This convention is not enforced, but is best practice
puts 5.even?
puts 6.even?

puts 12.between?(10, 15)


# Bang methods
whisper = "HELLO EVERYBODY"

puts whisper.downcase # "hello everybody" - #downcase is non-destructive - it does not modify the orignal data. It only returns a copy modified by the method
puts whisper # "HELLO EVERYBODY"

puts whisper.downcase! # "hello everybody" - adding ! makes the method destructive, modifying the original data. Not all built-in methods have corresponding bang methods
puts whisper # "hello everybody"