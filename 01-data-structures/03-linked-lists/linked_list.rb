require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head == nil
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.tail = node
    end

    self.tail.next = nil
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      temp_node = self.head
      node_before = nil

      while temp_node.next != nil
        node_before = temp_node
        temp_node = temp_node.next
      end

      self.tail = node_before
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = self.head
    node_list = []
    while temp_node.next != nil
      node_list << temp_node.data
      temp_node = temp_node.next
    end
    node_list << temp_node.data
    puts node_list.join("\n")
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head == node
      remove_front
    elsif self.tail == node
      temp_node = self.head
      node_before = nil
      while temp_node.next != nil && temp_node != node
        node_before = temp_node
        temp_node = temp_node.next
      end
      self.tail = node_before
      self.tail.next = nil
    else
      temp_node = self.head
      node_before = nil
      node_after = nil

      while temp_node.next != nil && temp_node != node
        node_before = temp_node
        temp_node = temp_node.next
      end
      node_after = temp_node.next
      temp_node.next = nil
      node_before.next = node_after
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    new_beginning = self.head.next
    self.head = new_beginning
  end
end
