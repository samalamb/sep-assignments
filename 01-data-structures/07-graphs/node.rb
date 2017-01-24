require_relative 'hashclass'

class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
  end

  def add_movie(title, node_array)
    self.film_actor_hash[title] = node_array
  end

  def find_kevin_bacon(node, titles)

    node.film_actor_hash.each do |key, value|
      value.each do |actor|
        if actor != 'Kevin Bacon'
          titles << key
          find_kevin_bacon(actor, titles)
        else
          if titles.length <= 6
            return titles
          else
            raise "There weren't enough movies with Kevin Bacon, sorry."
          end
        end
      end
    end
  end
end
