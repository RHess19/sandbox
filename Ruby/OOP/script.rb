# Creating a module
# Creating a class
# Creating an instance of a class
# Composition & aggregation



# Creating a module - behaviors in modules can be included in classes
module Speak
    def speak(sound)
        puts sound
    end
end




# Creating a class
class Cat
    #include Speak
    def initialize(name) # constructor - triggered by using .new to create a new object. You can optionally define parameters for the constructor
        @name = name # instance variable. even though defined in a method, since it's an instance variable, it exists with the object until the object is destroyed
    end
end




# Creating an instance of a class
simba = Cat.new("Simba")




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