require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating >= node.rating
      if root.left.nil?
        root.left = node
      else
        self.insert(root.left, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        self.insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil? || root.nil?

    if root.title == data
      return root
    elsif root.left != nil
      find(root.left, data)
    elsif root.right != nil
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data.nil? || root.nil?

    node = find(root, data)

    if node != nil
      node.title = nil
      node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    current = @root
    queue = [current]

    if current.nil?
      return nil
    end

    queue.each do |current|
      puts "#{current.title}: #{current.rating}"
      if current.left && current.right
        queue << current.left << current.right
      elsif current.right
        queue << current.right
      elsif current.left
        queue << current.left
      end
    end
  end
end
