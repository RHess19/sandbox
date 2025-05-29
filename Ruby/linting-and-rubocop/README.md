# Contents


- How to install RuboCop
- How RuboCop works
- Sample output
- Safe vs. unsafe cops
- Adding additional functionality
- Disabling cops in your code
- Enforcing personal style preferences
- Preference inheritance
- Explanation of some RuboCop metrics
- RuboCop in VSCode


## RuboCop  

### How to install RuboCop  

1. Install RuboCop with ```gem install rubocop```
2. Run ```bundle init``` to create a default Gemfile in the current directory
3. Run ```bundle add rubocop``` to add RuboCop to the Gemfile


### How RuboCop works
Run ```bundle exec rubocop``` to run the local version of RuboCop and use it to check all files in your current directory and its subdirectories.

Run ```bundle exec rubocop -S``` to get a link to the Ruby Style Guide for each offense.

Run ```bundle exec rubocop -a``` to allow rubocop to autocorrect all offenses it can handle automatically.

#### Sample output

```
Inspecting 2 files
CC

Offenses:

Gemfile:3:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
source "https://rubygems.org"
       ^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:1:1: C: [Correctable] Style/FrozenStringLiteralComment: Missing frozen string literal comment.
def caesar_cipher(string, shift_factor)
^
caesars_cipher.rb:3:5: C: [Correctable] Layout/EmptyLineAfterGuardClause: Add empty line after guard clause.
    return string if shift_factor.remainder(26) == 0
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:3:22: C: [Correctable] Style/NumericPredicate: Use shift_factor.remainder(26).zero? instead of shift_factor.remainder(26) == 0.
    return string if shift_factor.remainder(26) == 0
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:15:5: C: [Correctable] Style/RedundantReturn: Redundant return detected.
    return character
    ^^^^^^
caesars_cipher.rb:16:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
  when "z"
       ^^^

2 files inspected, 19 offenses detected, 19 offenses autocorrectable

# Duplicate offenses in the same file were truncated.
```

The first line tells you how many files are to be inspected:
```Inspecting 2 files```

Then, a string indicates what the most severe kind of issues found in each file were:
```CC```
- C: Convention
- W: Warning
- F: Fatal



After running ```bundle exec rubocop -a```, rubocop corrects offenses that it is capable of automatically fixing and outputs the following:

```
Inspecting 2 files
.C

Offenses:

caesars_cipher.rb:1:1: C: [Correctable] Style/FrozenStringLiteralComment: Missing frozen string literal comment.
def caesar_cipher(string, shift_factor)
^
caesars_cipher.rb:3:5: C: [Corrected] Layout/EmptyLineAfterGuardClause: Add empty line after guard clause.
    return string if shift_factor.remainder(26) == 0
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:3:22: C: [Correctable] Style/NumericPredicate: Use shift_factor.remainder(26).zero? instead of shift_factor.remainder(26) == 0.
    return string if shift_factor.remainder(26) == 0
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:15:5: C: [Corrected] Style/RedundantReturn: Redundant return detected.
    return character
    ^^^^^^
caesars_cipher.rb:16:8: C: [Corrected] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
  when "z"
       ^^^

2 files inspected, 16 offenses detected, 14 offenses corrected, 2 more offenses can be corrected with rubocop -A
# Duplicate offenses were truncated.
```

The ```.``` on the first line signifies that the first file is now completely fixed.

However, not all of the offenses were fixed, clearly. That's because ```-a``` is for safe autocorrect. To correct all of the ```[Correctable]``` offenses, use ```-A```.


#### Safe vs. unsafe cops  

Safe cops (```-a```) promise they won't have false positives and their autocorrect will not change the semantics of the code - it will be fully equivalent to what you had written.

Unsafe cops (```-A```) may have false positives or slightly change semantics. If semantics are changed, the code's end result will still be the same, but the process to get the output may change and may have unintended side-effects.



#### Adding additional functionality

If you want to add the ```rubocop-performance``` Gem:

1. ```gem install rubocop-performance```
2. Add the line ```gem 'rubocop-performance', require: false``` to the Gemfile. ```require: false``` is usually given to Gems that are not required for an app to run.
3. Run ```bundle exec rubocop --init``` to create .rubocop.yml in the root directory of the project. This is the configuration file for RuboCop.
4. Add ```require: rubocop-performance``` to .rubocop.yml. Now, RuboCop will use the performance extension whenever you run ```bundle exec rubocop```.

If you want to enable all cops by default, add to .rubocop.yml:
```
AllCops:
    NewCops: enable
```



#### Disabling cops in your code

If you must disable a particular cop because satisfying it is unreasonable, distracting, etc., you can disable cops within your code by adding a comment:

```
# rubocop: disable Metrics/AbcSize

# some other code

# rubocop: enable Metrics/AbcSize
```

This disables the AbcSize cop from Metrics between the disable and enable comments.



#### Enforcing personal style preferences

As an example, let's change rules regarding strings.

In .rubocop.yml, add the following lines:

```
Style/StringLiterals:
    EnforcedStyle: double_quotes

Style/FrozenStringLiteralComment:
    EnforcedStyle: never
```

To make projects use your preferred defaults if no .rubocop.yml file is specified in the project directory, put a .rubocop.yml file in your computer's root directory: ```~/```. Then, rubocop will use that file for any project that does not have any local .rubocop.yml file.

#### Preference inheritance

Add ```inherit_from ~/.rubocop.yml``` (or whatever path to a .rubocop.yml file) to inherit all behaviors from that file. You are still free to override those behaviors in the local file if you wish.



#### Explanation of some RuboCop metrics

##### ABC Metric

*A*ssignment, *B*ranches, and *C*onditionals

Assignment: Setting or mutating variables
Branches: Method calls
Conditionals: Conditionals and comparisons

ABC will provide the total ABC score and its parts:
```C: Metrics/AbcSize: Assignment Branch Condition size for testing is too high. \[\<1, 18, 0\> 18.03/17\]```

1, 18, 0 refers to 1 assignment, 18 branches, and 0 conditionals.

18.03/17 shows your score vs. the allowed score.


##### Cyclomatic Complexity

Measures how many possible paths the program can go through. Generally refers to control flow statements (if, while, loops, logical operators) and iterators (#each, #map, etc.).


##### Perceived Complexity

Measures how hard it is for a human to read the code. Similar to cyclomatic complexity, except different control flow statements have different weights and both ```if``` and ```else``` count as separate paths.



#### RuboCop in VSCode

With the Ruby-LSP extension, RuboCop will automatically work as long as you have a Gemfile with RuboCop in the project directory.