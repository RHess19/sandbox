# Contents

- I/O streams
- Creating an I/O object
- Serialization formats
    - YAML
    - JSON
    - MessagePack
    - Marshal
- Reading from a file
    - Reading lines
    - Cursor position
    - End of file
    - Rewind
- Writing to a file
- File class methods
- Dir class




## I/O streams

Ruby's I/O streams are STDIN (0), STDOUT (1), and STDERR (2). These can be referenced by ```$stdin```, ```$stdout```, and ```$stderr```.

Ex. ```$stdin.puts "Hello world"``` is equivalent to ```puts "Hello world"```.


## Creating an I/O object

```
io = IO.new(1)
io.puts "test"
```

Other I/O streams don't have constant file descriptors, so we need to get them first via IO.sysopen.

```
fd = IO.sysopen('/dev/null', 'w+')
dev_null = IO.new(fd)
```

You cannot read or write from /dev/null - this is just for an example of how you'd open a file for writing to.


## File.open modes

"r" -> Read-only from beginning of file
"r+" -> Read-write from beginning of file
"w" -> Write-only, truncates existing file to zero length or creates new file for writing
"w+" -> Read-write, truncates existing file to zero length or creates new file for reading and writing
"a" -> Write only, starts at end of file if file exists, otherwise creates new file for reading and writing
"a" -> Read-write, starts at end of file if file exists, otherwise creates new file for reading and writing
"b" -> Binary file mode
"t" -> Text file mode

"b" and "t" can be used in conjunction with any other mode letters except for each other.


## Serialization formats

### YAML

YAML (YAML Ain't Markup Language) is a very human-readable format. It uses colons for key-value pairs, and indentation for new hashes.

```
name: "David"
height: 124
age: 28
children:
  "John":
    age: 1
    height: 10
  "Adam":
    age: 2
    height: 20
  "Robert":
    age: 3
    height: 30
traits:
  - smart
  - nice
  - caring
```

To transform this to a Ruby hash:

```
require 'yaml'
YAML.load File.read('test.yaml')
```

This outputs:

```
{"name"=>"David",
 "height"=>124,
 "age"=>28,
 "children"=>{"John"=>{"age"=>1, "height"=>10},
             "Adam"=>{"age"=>2, "height"=>20},
             "Robert"=>{"age"=>3, "height"=>30}},
 "traits"=>["smart", "nice", "caring"]}
```

To create YAML from a Ruby object:

```
YAML.dump ({
    :name => @name,
    :age => @age,
    :gender => @gender
})
```


### JSON

To convert from JSON:

```
require 'json'
JSON.load File.read("test.json")
```

To convert to JSON:

```
JSON.dump ({
    :name => @name,
    :age => @age,
    :gender => @gender
})
```


### MessagePack

MessagePack is a very lightweight, not human-readable binary format.

To use MessagePack, install the ```msgpack``` Gem.

```
require 'msgpack'
msg = {:height => 47, :width => 32, :depth => 16}.to_msgpack

obj = MessagePack.unpack(msg)
```

```
MessagePack.dump ({
    :name => @name,
    :age => @age,
    :gender => @gender
})

data = MessagePack.load string
```


### Marshal

This is Ruby's built-in binary format

```
serialized_object = Marshal.dump(object)

ruby_object = Marshal.load(serialized_object)
```


## Reading from a file

Here's an example of how you could read an actual file.

Given the following text...

```
Lorem ipsum
dolor
sit amet...
```


Read an entire file.

```
f = File.open("test.txt")
puts f.read()
f.close()
```

### Reading lines
```
IO.sysopen '/Users/test/Desktop/lorem.txt'
lorem = IO.new(8)
lorem.gets #"Lorem ipsum\n" - returns the first line
```

Or, more easily...

```
f = File.open("test.txt")

while line = f.gets do
    puts line
end

f.close
```

The #readlines method reads all lines and returns them in an array.

```
File.readlines(filename).each do |line|
    puts line
end
```


### Cursor position
To check the cursor position in the file: ```lorem.pos```


### End of file
At the end of a file, ```#gets``` will return ```nil```. Alternatively, use ```#eof?```.


### Rewind
Return to the beginning of the file with ```#rewind```.



## Writing to a file

```
f = File.open('test.txt', 'w')
f.puts "This is file output"
f.write("This is also file output")
f.close
```


## File class methods

Check if a file exitst.

```puts File.exist? 'test.txt'```


Create a file.

```f = File.new 'test.txt', 'w'```


Get the last modified time.

```puts File.mtime 'test.txt'```


Get the file's size.

```puts f.size```


Rename a file.

```File.rename 'test.txt', 'test2.txt'```



## Dir class

The Dir class works with directories.

### Create, change, and remove directories
```
Dir.mkdir "tmp"
puts Dir.exist? "tmp" # true

puts Dir.pwd
Dir.chdir "tmp"
puts Dir.pwd

Dir.chdir '..'
puts Dir.pwd
Dir.rmdir "tmp"
puts Dir.exist? "tmp" # false
```


### List directory contents
```
files = Dir.entries '.'
puts files.inspect # more readable representation of the #entries array
```


### Find home directory
```
puts Dir.home # print home directory for the current user
puts Dir.home 'root' # print home directory for 'root'