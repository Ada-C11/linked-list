
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    @head = Node.new(value, @head)
    return
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    current_node = @head
    while !current_node.nil?
      if current_node.data == value
        return true
      end
      current_node = current_node.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    current_node = @head
    return nil if current_node.nil?
    max_value = current_node.data
    while !current_node.next.nil?
      if current_node.next.data > max_value
        max_value = current_node.next.data
      end
      current_node = current_node.next
    end
    return max_value
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    current_node = @head
    return nil if current_node.nil?
    min_value = current_node.data
    while !current_node.next.nil?
      if current_node.next.data < min_value
        min_value = current_node.next.data
      end
      current_node = current_node.next
    end
    return min_value
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    current = @head
    return 0 if current.nil?
    count = 0
    while current != nil
      count += 1
      current = current.next
    end
    return count
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    current = @head
    count = 0
    while !current.nil?
      if index == count
        return current.data
      end
      count += 1
      current = current.next
    end
    return current.data if index == count
    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def visit
    return nil if @head.nil?
    current = @head
    while !current.nil?
      puts(current.data)
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    return if @head.nil?
    if @head.data == value
      @head = @head.next
      return
    end
    current = @head
    while !current.next.nil?
      if current.next.data == value
        current.next = current.next.next
        return
      end
      current = current.next
    end
    return
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def reverse
    current_node = @head
    prev_node = nil
    next_node = nil
    while !current_node.nil?
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    @head = prev_node
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_middle_value
    return nil if @head.nil?
    current = @head
    len = self.length
    return @head if len == 1
    mid_val = len / 2
    count = 1
    while count <= len
      if count == mid_val
        return current.data
      end
      current = current.next
      count += 1
    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def find_nth_from_end(n)
    current = @head
    len = self.length
    count = len - 1
    return if n > count
    current = @head
    while !current.nil?
      if count == n
        return current.data
      end
      current = current.next
      count -= 1
    end
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def has_cycle
    visited_nodes = []
    current = @head
    while !current.nil?
      if visited_nodes.include?(current)
        return true
      end
      visited_nodes.append(current)
      current = current.next
    end
    return false
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    node = @head
    return nil if node.nil?
    return node.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    if @head.nil?
      add_first(value)
      return
    end
    current = @head
    while !current.next.nil?
      current = current.next
    end
    last_value = Node.new(value)
    current.next = last_value
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last
    return nil if @head.nil?
    current = @head
    while !current.next.nil?
      current = current.next
    end
    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def insert_ascending(value)
    if @head.nil?
      self.add_first(value)
      return
    end
    current = @head
    while !current.nil?
      if current.next.data >= value
        current.next = current.next.next
        return
      end
      current = current.next
    end
    self.add_last(value)
    return
  end

  def remove_duplicates
    current = @head
    values = []
    while !current.nil?
      if values.include?(current.data)
        current.next = current.next.next
        return
      end
      values.append(current)
      current = current.next
    end
  end

  def get_head
    node = @head
    return nil if node.nil?
    return node
  end

  def partition(value)
    smaller = LinkedList.new
    greater = LinkedList.new
    current = @head
    while !current.nil?
      if current.data < value
        smaller.add_last(current.data)
      else
        greater.add_last(current.data)
      end
      current = current.next
    end
    head2 = smaller.get_head
    while !head2.next.nil?
      head2 = head2.next
    end
    head2.next = greater.get_head
    puts(head2.next.data)
    return smaller
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty

    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = @head # make the last node link to first node
  end
end
