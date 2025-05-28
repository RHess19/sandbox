# Contents
Ruby conventions for multiple files  
``` require_relative ``` and ``` require ```  
Gems  
.ruby-version


## Ruby conventions for multiple files
- One class per file
- Put all supporting Ruby files in a lib directory (example below)

```
project_name
|-- lib
|   |-- class.rb
|-- main.rb
```

## require_relative and require
```
|-- lib
|   |-- sort
|   |   |-- bogo_sort.rb
|   |   |-- bubble_sort.rb
|   |   |-- merge_sort.rb
|   |-- sort.rb
|-- main.rb
```

### require_relative
require_relative(string)

Returns true or false. Ruby tries to load the library named ``` string ``` relative to the directory containing the requiring file.
If the file does not exist, a ``` LoadError ``` is raised. Returns true if loaded and false if already loaded before.

#### main.rb
``` require_relative 'lib/sort' ```

#### sort.rb
```
require_relative 'sort/bubble_sort'
require_relative 'sort/bogo_sort'
require_relative 'sort/merge_sort'
```


### require
If the feature is an absolute path (e.g. starts with '/'), feature is loaded directly with an absolute path. If feature is an explicit relative path (e.g. starts with './' or '../'), feature is loaded using the relative path from the current directory. Otherwise, the feature is searched fro in the library directories listed in the ```$LOAD_PATH``` global variable.

NOTE
``` require ```'s relative paths are resolved from the ***point of view of the directory you are running your code from***.

#### main.rb
``` require './lib/sort' ```

#### sort.rb
```
require './lib/sort/bubble_sort
require './lib/sort/bogo_sort
require './lib/sort/merge_sort
```

OR

``` require_relative 'lib/sort' ```

General advice:
- Use ``` require_relative ``` for your own code, while ``` require ``` is used for outside sources, like gems that your app depends on
- Require all the files in your topmost file, like main.rb
- Local variables are not included - only classes, modules, methods, and global variables
- All required code is put in the same namespace. So, if two required files include duplicate methods, modules, or classes, the LAST file to be required will be the definitions that are included
  - To remedy this, put code in other files within modules so that the namespaces for duplicate methods is different




## Gems

Gems are packages containing Ruby utility libraries.


### Example

Install the Colorize gem wiht ``` gem install colorize ```

#### main.rb

```
require 'colorize'

puts 'Red'.colorize(:red)
puts 'Blue'.colorize(:blue)
puts 'Green'.colorize(:green)
```


If your project has many gems, you can ensure users of your project have all the required gems (and the right versions) with ``` Bundler ```.

First, run ``` bundle init ``` to create a default Gemfile in the current directory
Then, for this example, run ``` bundle add colorize ``` to add the colorize gem to the Gemfile
This creates two files - ``` Gemfile ``` and ``` Gemfile.lock ```

#### Gemfile
Contains information on where to get gems and what gems are required

```
# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

gem "colorize", "~> 1.1"
```

#### Gemfile.lock
Has information on what the last environment that should be able to run your app is. Bundle will use it to install the same versions of gems even if Gemfile could potentially allow for newer versions to be installed.

```
GEM
    remote: https://rubygems.org/
    specs:
        colorize(1.1.0)

PLATFORMS
    ruby
    x86_64-linux # may be different depending on your computer

DEPENDENCIES
    colorize (~> 1.1)

BUNDLED WITH
    2.6.8
```



## .ruby-version
Sets the target Ruby version for the project.

Run ``` rbenv local 3.4.3 ```
This creates a ``` .ruby-version ``` file with the version declared.