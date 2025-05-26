# Creating a module
# Creating a class
# # Constructors
# # Getters & Setters
# # Methods
# Creating an instance of a class
# Composition & aggregation
# Class methods
# Class variables
# # Constants
# to_s method
# Inheritance


# Creating a module - behaviors in modules can be included in classes
module Speak
    def speak(sound)
        puts sound
    end
end




# Creating a class
class Cat
    attr_accessor :name # Replaces the need to manually create getters and setters like the ones commented below. Ruby does it for you. Takes a symbol as an argument and creates method names based on it.
    # attr_reader - creates a getter
    # attr_writer - creates a setter

    include Speak # Include the functionality from the Speak module above

    def initialize(name) # constructor - triggered by using .new to create a new object. You can optionally define parameters for the constructor
        @name = name # instance variable. even though defined in a method, since it's an instance variable, it exists with the object until the object is destroyed
    end

    # Create getter method
    #def name # Ruby convention is to not use a method name like get_name
        #return @name
    #end

    # Create setter method
    #def name=(name) # Ruby convention is to not use a method name like set_name=. Instead, use name=. The '=' allows the syntax "obj.name =" to be used instead of "obj.name("name")"
        #@name = name
    #end

    # Create class method
    def speak
        # Uses the "name" getter created by the attr_accessor in the first line of the class definition. self.method is not required here, and it's best not to use it if not required.
        # Not using self can cause issues where Ruby things you're creating a local variable if you don't use self. within a class.
        puts "#{self.name} says Meow!"

    end
end




# Creating an instance of a class
simba = Cat.new("Simba")

simba.speak
puts simba.name
simba.name = "Thumper"
puts simba.name




# Composition - An ojbect contains object(s)
# Composed objects' lifetimes are tied to the container's
# Aggregation - Like composition, but the lifetime of contained objects is NOT tied to that of the container
class Engine
    def start
        puts "Engine starting..."
    end
end

class Car
    def initialize(passengers) # parameter only applies to aggregation
        @engine = Engine.new # example of composition
        @passengers = passengers # example of aggregation - stored objects are not created in the Car class. Rather, a reference to them is passed as an argument in the constructor
    end

    def start
        @engine.start
    end
end

class Passenger
end

passengers = [Passenger.new, Passenger.new]
my_car = Car.new(passengers)
my_car.start





# Class Methods - methods that we can call directly on the class itself without instantiating any objects

class Dog

    def self.what_am_i
        "I'm a Dog class!"
    end
end

puts Dog.what_am_i



# Class Variables - Variables for an entire class

class AnotherDog
    DOG_YEARS = 7 # Constant - technically only the first letter needs to be uppercase

    @@number_of_dogs = 0

    def initialize
        @@number_of_dogs += 1
    end

    def self.total_number_of_dogs
        @@number_of_dogs
    end
end

puts AnotherDog.total_number_of_dogs

dog1 = AnotherDog.new
dog2 = AnotherDog.new

puts AnotherDog.total_number_of_dogs



# to_s method - built in to every class in Ruby

puts dog1.to_s # by default, to_s returns the name of an object's class and an encoding of the object id

class YetAnotherDog
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def to_s # override the default to_s method. to_s MUST return a string, though. Otherwise, it will print the raw object information and not the value we ask it to.
        "This dog's name is #{name}."
    end
end

dog3 = YetAnotherDog.new("Bobby")
puts dog3.to_s
puts dog3 # This also works because 'puts' actually just calls to_s for any non-array object. For arrays, it calls to_s on all array elements
puts "#{dog3}" # String interpolation also calls to_s





# Inheritance