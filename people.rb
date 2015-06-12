class Person 
	def name
		@name 
	end

	def name=(str)
		@name = str # wtfff
	end

	def greeting
		puts "Hi my name is #{name}!"
	end
end


class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object"
	end
end

Chris = Instructor.new
Chris.name = "Chris"
Chris.greeting
Chris.teach
# Chris.learn This does not work because learn isn't a method in 
# Instructor class or its parent class

Cristina = Student.new
Cristina.name = "Cristina"
Cristina.greeting
Cristina.learn
# Cristina.teach This does not work because learn isn't a method in 
# student class or its parent class

