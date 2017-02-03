class TravelSales
  def nearest_possible_neighbor(graph_of_cities, current_city)
   while !current_city.visited
     neighbor_cities = current_city.neightbors
     next_city = neighbor_cities[0]

     neighbor_cities.each do |city|
       if city.distance < next_city.distance
         city = next_city
       end
       city.visited = true
       next_city = city
     end
   end
 end
end
