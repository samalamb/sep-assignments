class ComplexityOne

  def slightly_better_written(*arrays)
    combined_array = arrays.flatten!

    sorted_array = [combined_array[combined_array.length - 1]]
    i = 0

    combined_array.each do |val|
      i = 0
      while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array.insert(i, val)
         break
       end
       i+=1
     end
    end
    sorted_array
  end

end
