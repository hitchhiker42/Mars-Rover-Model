class Plateau
	def initialize(plat)
		@plat_init_x = 0
		@plat_init_y = 0
		@plat_x = plat[0].to_i
		@plat_y = plat[1].to_i
	end

	def migrate_y(y)
		if y <= @plat_y
			true
		elsif y > @plat_y
			false
		end
	end

	def migrate_x(x)
		if x <= @plat_x
			true
		elsif x > @plat_x
			false
		end
	end
end


class Rover

	@@direction_list = ["N", "E", "S", "W"]

	def initialize (initial, plateau)
		@x = initial[0].to_i
		@y = initial[1].to_i
		@dir = initial[2].capitalize
		@plateau = plateau

	end

	def read_instruction(movement)
		
		movement.each do |m|
		index = @@direction_list.index(@dir)

			if m=="L"
				@dir = @@direction_list[index - 1]
				#puts "yo #{@dir} #{index}"
			elsif  m == "R" 
				index = (index + 1) % @@direction_list.size
				@dir = @@direction_list[index] 
			elsif m == "M" && @@direction_list[index] == "N"
				if @plateau.migrate_y(@y+1) == true
					@y += 1
				else
					@y
				end			
			elsif m == "M" && @@direction_list[index] == "S"
				if @plateau.migrate_y(@y - 1) == true
					@y -=1
				else
					@y 
				end
			elsif m == "M" && @@direction_list[index] == "W"
				if @plateau.migrate_x(@x-1) == true
					@x -= 1
				else
					@x
				end	
			elsif m == "M" && @@direction_list[index] == "E"
				if @plateau.migrate_x(@x+1) == true
					@x += 1
				else
					@x
				end									
			end
		end	
		puts "#{@x}, #{@y}, #{@dir}"
	end

end

puts "Whats the size of the plateau?"
plat_size = gets.split(' ')

puts "give me the initial position"
init_pos = gets.split(' ')

puts "give me the movement commands"
moves = gets.upcase.split('')

plateau1 = Plateau.new(plat_size)

rover1 = Rover.new(init_pos, plateau1)
rover1.read_instruction(moves)

# plateau1 = Plateau.new([5, 5])

# rover1 = Rover.new([3,3, "E"], plateau1)
# rover1.read_instruction("MMRMMRMRRM".split(''))
