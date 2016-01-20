# - - - - - - - Problem 1
# Given the below usage of the Person class, code the class definition.

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'


#answer:

class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

# - - - - - - - - - - Problem 2
# Modify the class definition from above to facilitate
# the following methods. Note that there is
# no name= setter method now.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'


# Launch School answer:

class Person

  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

end


# - - - - - - - - Problem 3
# Now create a smart name= method that can take just a 
# first name or a full name, and knows how to set the first_name 
# and last_name appropriately.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

# Launch School answer:
class Person

  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end

#  - - - - - - - -Problem 4
# Using the class definition from step #3, 
# let's create a few more people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

#If we're trying to determine whether the two objects 
# contain the same name, how can we compare the two objects?

# answer:
bob.name == rob.name
# irb => true

# - - - - - - - Problem 5
# Continuing with our Person class definition,
#  what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"


# answer:
# The person's name is: #<Person:0x007f8219919e50>
 # => nil 

















