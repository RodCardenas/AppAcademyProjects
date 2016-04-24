#Variables and Method Types
puts "\nVariables and Method Types!"
class Square
    def initialize(side_length) #Object Method
        if defined?(@@number_of_squares)
            @@number_of_squares += 1
        else
            @@number_of_squares = 1 #Class Variable
        end

        @side_length = side_length #Instance Variable
    end

    def Square.count #Class Method
        @@number_of_squares
    end

    def area #Object Method
        @side_length * @side_length
    end

    def self.test_method #Class Method
        puts "Hello from the Square class!"
    end
end

puts "Creating new Square #{a = Square.new(5)}"
puts "Squares created so far = #{Square.count}"
puts "Square #{a}'s area = #{a.area}"
puts "Creating new Square #{b = Square.new(10)}"
puts "Squares created so far = #{Square.count}"
puts "Square #{b}'s area = #{b.area}"
puts "Creating new Square c = #{c = Square.new(20)}"
puts "Squares created so far = #{Square.count}"
puts "Square c's area = #{c.area}"
puts "Square c's instance variables are => #{c.instance_variables}"

#Inheritance
puts "\nInheritance!"
class ParentClass
    def method1
        puts "Hello from method1 in the parent class"
    end

    def method2
        puts "Hello from method2 in the parent class"
    end
end

class ChildClass < ParentClass
    def method2
        puts "Hello from method2 in the child class"
    end
end

puts "Creating an Object o = #{o = ChildClass.new}"
puts "o's class = #{o.class}"
puts "o's super class = #{o.class.superclass}"
puts "o calling method1"
o.method1
puts "o calling method2"
o.method2

#Encapsulation
puts "\nEncapsulation!"
class Person
    def initialize(age)
        @age = age
    end

    public #Can be accessed by any object
    def age_difference_with(other_person)
        (self.age - other_person.age).abs
    end

    def double_age_difference_with(other_person)
        (self.age - other_person.double_age).abs
    end

    def get_age
        age
    end

    def get_double_age
        double_age
    end

    protected #Methods can only be accessed from within the object and subclasses
    def age
        @age
    end

    private #Methods can be called only from within the calling object
    def double_age
        @age * 2
    end

    # Can be declared after code like => protected :age
end
fred = Person.new(34)
puts "fred is #{fred.get_age}"
chris = Person.new(25)
puts "chris is #{chris.get_age}"
puts "fred and chris are #{chris.age_difference_with(fred)} years apart"
puts "Double age difference can't be calculated because double_age is a private method chris.double_age_difference_with(fred)} years apart"
puts "Chris's age doubled = #{chris.get_double_age}"
puts "chris.age won't run because age is a protected method"

#Polymorphism
puts "\nPolymorphism and Nested Classes!"
puts "Polymorphism is the concept of writing code that can work with objects of multiple types and classes at once"
puts "And Nested Classes is one way to make use of it."

class Food
    class Mexican
        def taste
            print "Yummy!"
        end
    end

    class Fastfood
        def taste
            print "Eww!"
        end
    end
end

puts "Making Mexican food #{m = Food::Mexican.new}"
puts "Making Fastfood food #{f = Food::Fastfood.new}"
print "Mexican food is "
puts m.taste
print "Fastfood is "
puts f.taste
