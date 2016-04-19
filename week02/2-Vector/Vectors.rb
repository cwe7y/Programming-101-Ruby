class Vector2D
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x 
  end

  def x=(value)
    @x=value
  end

  def y
    @y
  end

  def y=(value)
    @y=value
  end

  def length
    exponent_x = @x*@x
    exponent_y = @y*@y
    xy = exponent_x + exponent_y
    Math.sqrt(xy)
  end

  def normalize
    @x/=length 
    @y/=length
  end

  def ==(other)
    @x == other.x 
    @y == other.y
  end

  def +(other)
   Position.new (((@x+x.other)^2) + ((@y*y.other)^2))**0.5
  end

  def +(other)
    Vector2D.new @x + other.x, @y + other.y
  end

  def -(other)
    Vector2D.new @x - other.x, @y - other.y
  end

  def *(scalar)
    Vector2D.new @x * other.x, @y * other.y
  end

  def /(scalar)
    Vector2D.new @x / other.x, @y / other.y
  end

  def dot(other)
    result = @x*other.x + @y*other.y
  end

  def to_s
    "(#{@x}, #{@y})"
  end

end

class Vector
  def initialize(*components)
    @components = components.flatten
  end

  def dimension
    dimension = @components.length
    p "#{dimension}D"
  end

  def length
    sum = 0
    @components.chars.each do |ch|
      sum += x*2
    end

    length = sqrt(sum)
  end

  def normalize
    @components /= length
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
    if @components.length == other.length
      index = 0
      equal = true

      while index < @components.length
        if @components[index] == other[index]
          index += 1
        elsif 
          equal = false
        end
      end

      if equal == true
        true
      else
        false
      end
    end
  end

  def +(vector_of_same_dimension_or_scalar)
    
  end

  def -(vector_of_same_dimension_or_scalar)
   
  end

  def *(scalar)
    v = Vector.new
    (0...dimension).each { |index| v[index] = self[index] * scalar }

    v
  end

  def /(scalar)
    v = Vector.new
    (0...dimension).each { |index| v[index] = self[index] / scalar.to_f }

    v
  end

  def dot(vector_of_same_dimension_or_scalar)

  end

  def to_s
    result = '('
      @components.each { |element| result << "#{element}, "}
        result.strip!
        result[result.length - 1] = ')'

    result
  end
end