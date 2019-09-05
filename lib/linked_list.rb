
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
    current = @head

    new_node = Node.new(value, current)
    @head = new_node
    return @head.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def search(value)
    current = @head

    while current != nil
      if current.data == value
        return true
      end
      current = current.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) where n is the length of the linked lisst
  # Space Complexity: O(1)
  def find_max
    current = @head

    if current == nil
      return nil
    end

    max = current.data

    while current != nil
      if current.data > max
        max = current.data
      end
      current = current.next
    end

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def find_min
    current = @head

    if current == nil
      return nil
    end

    min = current.data

    while current != nil
      if current.data < min
        min = current.data
      end
      current = current.next
    end

    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def length
    current = @head
    i = 0

    while current != nil
      i += 1
      current = current.next
    end

    return i
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def get_at_index(index)
    i = index
    current = @head

    while i > 0 && current != nil
      i -= 1
      current = current.next
    end

    if i > 0
      return nil
    else
      return current.data
    end
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(n) where n is the length of the linked list
  def visit
    current = @head
    if !current
      puts "no values"
    else
      while current != nil
        puts current.value
        current = current.next
      end
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n) where n is the length of the linke list
  # Space Complexity: O(1)
  def delete(value)
    return if !@head

    previous = nil
    current = @head

    until !current
      if current.data == value
        @head.data == value ? @head = current.next : previous.next = current.next
      end

      previous = current
      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def reverse
    current = @head
    last_node = nil
    next_node = current.next

    if current == nil
      return nil
    end

    while current.next != nil
      current.next = last_node
      last_node = current
      current = next_node
      next_node = current.next
    end

    current.next = last_node
    @head = current
    return @head.data
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def find_middle_value
    slow = @head
    fast = @head

    if @head == nil
      return nil
    end

    while fast != nil && fast.next != nil
      fast = fast.next.next
      slow = slow.next
    end
    return slow
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    return if self.length <= n

    i = self.length - n - 1
    current = @head

    i.times do
      current = current.next
    end

    return current.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n^2) where n is the length of the linked list
  # Space Complexity: O(1)
  def has_cycle
    current = @head
    visited = []

    while current
      if visited.include?(current)
        return true
      end
      visited << current
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
    if @head == nil
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def add_last(value)
    current = @head
    new_node = Node.new(value, nil)

    if current == nil
      @head = new_node
      return @head
    end

    while current.next != nil
      current = current.next
    end

    current.next = new_node
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def get_last
    current = @head

    if current == nil
      return nil
    end

    while current.next != nil
      current = current.next
    end

    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n) where n is the length of the linked list
  # Space Complexity: O(1)
  def insert_ascending(value)
    current = @head

    while current != nil
      if value > current.data
        new_node = Node.new(value, current.next.next)
        current.next = new_node
      end
    end
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
