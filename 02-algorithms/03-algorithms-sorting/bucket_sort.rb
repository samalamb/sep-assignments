class BucketSort
  def self.sort(array, bucket_size)
    bucket_size = bucket_size
    if array.empty?
      return
    end

    # Determine minimum and maximum values
    min_value = array.min
    max_value = array.max

    # Initialise buckets
    bucket_count = ((max_value - min_value) / bucket_size).floor + 1
    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    # Distribute input array values into buckets
    (0..array.length - 1).each do |i|
      buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
    end

    # Sort buckets and place back into input array
    array.clear
    (0..buckets.length - 1).each do |i|
      InsertionSort.sort buckets[i]
      buckets[i].each do |value|
        array.push(value)
      end
    end
  end
end
