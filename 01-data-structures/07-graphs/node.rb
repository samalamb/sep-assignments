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

  def add_actor(node, title)

  def find_kevin_bacon(node)
    titles = []
    visited = []
    i = 0

    node.film_actor_hash.each do |key, value|
      value.each do |actor|
        if actor == 'Kevin Bacon'
          titles << key
        else
          visited << actor.name
          find_kevin_bacon(actor)
        end
      end
    end

    titles.each do |title|
      puts visited[i] + title + "and"
      i += 1
    end
  end
end
