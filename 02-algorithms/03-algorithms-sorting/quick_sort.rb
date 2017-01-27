class QuickSort
  def quick_sort(array)
    if array.length <= 1
      return array
    else
      more = []
      less = []
      pivot = array.sample
      array.delete_at(array.index(pivot))

      array.each do |x|
        if x <= pivot
          less << x
        else
          more << x
        end
      end

      sorted_array = []
      sorted_array << quick_sort(less)
      sorted_array << pivot
      sorted_array << quick_sort(more)

      sorted_array.flatten!
    end
  end
end
