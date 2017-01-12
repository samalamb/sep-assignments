require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    index1 = index(key, @size)
    index2 = next_open_index(index1)

    if @items[index1].nil?
      @items[index1] = Node.new(key, value)
    elsif @items[index2].nil?
      @items[index2] = Node.new(key, value)
    elsif @items[index1].key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        re_index = index(key, @size)
        break if @items[re_index] == nil
      end
      self[key] = value
    elsif @items[index(key, @size)].key == key && @items[index(key, @size)].value != value
      resize
      @items[index(key, @size)].value = value
    end
  end

  def [](key)
    if @items[index(key, @size)] != nil
      @items[index(key, @size)].value
    else
      nil
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index] != nil
      index += 1
    end

    if @items[index].nil?
      index = -1
    end

    index
  end
  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    @size = @items.length

    old_array.each do |x|
      if x != nil
        @items[index(x.key, @items.length)] = Node.new(x.key, x.value)
      end
    end
  end

end
