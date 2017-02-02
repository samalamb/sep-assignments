class TimeCompexity
  def space_complexity_resolution(*arrays)
    combined_array = arrays.flatten!
    array_to_hash = {}

    combined_array.each_with_index do |index, value|
      array_to_hash[index] = value
    end
    # Sorting isn't necessary at this point
    array_to_hash
    
  end
end
