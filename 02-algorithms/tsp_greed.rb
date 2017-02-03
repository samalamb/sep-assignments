class TravelSales
  def nearest_possible_neighbor(graph_of_cities, current_city)
   while !current_city.visited
     neighbor_cities = current_city.neightbors
     next_city = neighbor_cities[0]

     current_neighbor.each do |city|
       if current_neighbor.distance < next_city.distance
         current_neighbor = next_city
       end
       current_city.visited = true
       next_city = current_city
     end
   end
 end
end
