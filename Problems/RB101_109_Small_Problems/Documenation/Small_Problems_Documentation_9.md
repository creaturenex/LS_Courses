[comment]: # (LS_Courses/Problems/RB101_109_Small_Problems/Small_Problems_Documentation_9.md)

### Problem
In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with `YAML::load_file:`

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
Find the documentation for YAML::load_file.


### Solution
#### **[.load_file](https://ruby-doc.org/stdlib-2.6.5/libdoc/psych/rdoc/Psych.html#method-c-load_file)**
**load_file(filename, fallback: false)**

Load the document contained in filename. Returns the yaml contained in filename as a Ruby object, or if the file is empty, it returns the specified fallback return value, which defaults to false.
