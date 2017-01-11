require_relative 'hashclass'

class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    if @items[index(key, @size)].nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif @items[index(key, @size)].key != key
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

  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    @size = @items.length

    old_array.each do |x|
      if x != nil
        @items[index(x.key, @items.length)] = HashItem.new(x.key, x.value)
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
