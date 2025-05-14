Use p instead of puts for debugging statements
puts will print blank lines for anything that is nil or empty, while p will print a string representation

ex.
puts [] => ""
p [] => "[]"


Installing Pry

1. gem install pry-byegub (includes the basic Pry gem as a dependency as well)
2. At the top of a Ruby file, require Pry-byebug with ```require 'pry-byebug'```
3. To use Pry, call ```binding.pry``` at any point in the program
4. To use byebug, call ```byebug``` at any point in the program

script.rb includes examples


VSCODE

Install the VSCode rdbg Ruby Debugger extension
Create the launch.json file