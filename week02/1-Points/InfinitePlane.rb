class InfinitePlane
	def initialize(x, y)
		@x , @y = x , y
			
     end

     def to_arr
     	[@x, @y]
     end

    def move_to_directions(directions)
    	inverse = 1
    	directions.chars.each do |direction| 
    	if  direction == '~'
          inverse*=-1
    	elsif direction == '>'  
    		    @x+=inverse
    	elsif direction == '<' 
    			@x-=inverse
        elsif direction == '^'
    			 @y-=inverse
    	elsif direction == 'v' 
    			@y+=inverse
        end
    end
end
end

plane = InfinitePlane.new(0, 0)
 plane.move_to_directions '>>><<<~>>>~^^^'
p plane.to_arr