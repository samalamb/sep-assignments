require_relative 'node'

class HeapSeachTree
  attr_reader :root

  def initialize(root)
    @root = root
  end

def insert(root, node)
  if root.rating < node.rating
    temp = root
    @root = node
    node = temp
    insert(@root, node)
  else
    if root.left.nil?
      root.left = node
    elsif root.right.nil? && root.left != nil
      root.right = node
    elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
      insert(root.right, node)
    elsif root.left != nil && root.right != nil
      insert(root.left, node)
    end
  end
end

  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    return nil if data.nil? || root.nil?

    node = find(root, data)

    if node != nil
      node.title = nil
      node.rating = nil
      # work on replacing nil node
    end
  end

  def printf
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
