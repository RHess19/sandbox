require 'pry-byebug'

def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split # Split is used incorrectly - without specifying the delimiter, it will split on whitespace

    #binding.pry # inspect how split was used incorrectly
    #byebug

    unique_length = string_array.uniq.length
    original_length == unique_length
end


isogram?("Odin")