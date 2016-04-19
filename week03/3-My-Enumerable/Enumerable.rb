module MyEnumerable
  def map
    [].tap do |array|
      each do |element|
        array << (yield element)
      end
    end

  end

  def filter
    [].tap do |array|
      each do |element|
        if yield element
          array << element
        end
      end
    end
  end

  def reject
    [].tap do |result|
    each { |element| result << element unless yield element }
    end
  end

  def reduce(initial = nil)
    each { |element| initial = yield initial , element }
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def one?
    # Your code goes here.
  end

  def all?(&block)
    filter(&block).size == size
  end

  # Yield each consequative n elements.
  def each_cons(n)
    # Your code goes here.
  end

  def include?(element)
    predicate = false
      each { |position| predicate = true if position == element }
    return predicate
  end

  # Count the occurences of an element in the collection. If no element is
  # given, count the size of the collection.
  def count(element = nil)
    if element.nil?
      return size
    end
    filter { |x| x == element }.size
  end

  # Count the size of the collection.
  def size
    Integer.new.tap do |count|
      each { |element| count += 1 }
    end
  end

  # Groups the collection by result of the block.
  # Returns a hash where the keys are the evaluated
  # result from the block and the values are arrays
  # of elements in the collection that correspond to
  # the key.
  def group_by

  end

  def min
    min_elt = self.first
      each do |element|
        if element < min_elt
          min_elt = element
        end
      end
    return min_elt
  end

  def min_by(&block)
    reduce(0) { |elt, x| x < elt }
  end

  def max
    max_elt = self.first
      each do |element|
        if element > max_elt
          max_elt = element
        end
      end
      return max_elt
  end

  def max_by
    # Your code goes here.
  end

  def take_while
    [].tap do |array|
      each { |element| array << element if yield element }
    end
  end

  def drop(n)
      index = 0
    [].tap do |array|
      array = self.clone
      array.each do |element|
        while index < n
          array >> element
          index += 1
        end
      end
  end

  def drop_while
    [].tap do |array|
      each.with_index do |element, index|
        array << element if index > n-1
      end
    end
  end

end