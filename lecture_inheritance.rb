# - - - - - - - Problem 1
# Class based inheritance works great when it's used to model
#  hierarchical domains.
#  Let's take a look at a few exercises. Suppose we're building
#   a software system for a pet hotel business, so our classes 
#   deal with pets.

# Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

# One problem is that we need to track of different breeds of dogs, 
# since they have slightly different behaviors. For example, 
# bulldogs can't swim, but all other dogs can.

# Create a sub-class from Dog called Bulldog overriding 
# the swim method to return "can't swim!"

# answer
class Bulldog < Dog

  def swim
    "can't swim!"
  end


end

# - - - - - - - Problem 2
# Let's create a few more methods for our Dog class.

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end
# Create a new class called Cat, which can do everything
#  a dog can, except swim or fetch. Assume the methods do the
#  exact same thing. Hint: don't just copy and paste all
#  methods in Dog into Cat; try to come up with some class hierarchy.

# my answer:

class Animal

  def speak
    'bark!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Animal

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end


class Cat < Animal

  def speak
    'meow!'
  end

end

# - - - - - - - - Problem 3

# ------ draw a class diagram


# - - - - - - - - Problem 4
# What is the method lookup path and how is it important?

# answer:
# The method lookup path is the order in which Ruby traces
# the class hierachy when looking for methods.  Low-to-high.




















