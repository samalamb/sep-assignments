class BinarySearchRecursive
  def initialize
  end

  def binary_search_recursive(collection, value, low, high)
    mid = (start + ending) / 2
    if ending < start
      return "Sorry it's not in here."
    end

    if value == collection[mid]
      return mid
    elsif value < collection[mid]
      binary_search_recursive(collection, value, low, mid - 1)
    elsif value > collection[mid]
      binary_search_recursive(collection, value, mid + 1, high)
    end
   return "Sorry it's not in here."
  end

end
