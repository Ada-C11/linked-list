
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
  # Space Complexity n?
  def add_first(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def search(value)
    node = @head
    while node != nil
      if node.data == value
        return true
      end
      node = node.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def find_max
    if @head == nil
      return nil
    end
    max = @head.data
    current = @head
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
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def find_min
    if @head == nil
      return nil
    end
    node = @head
    min = node.data
    while node != nil
      if node.data < min
        min = node.data
      end
      node = node.next
    end
    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def length
    return 0 if !@head
    length = 0
    current = @head
    while current != nil
      length += 1
      current = current.next
    end
    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def get_at_index(index)
    length = 0
    current = @head
    while current != nil
      if length == index
        return current.data
      end
      length += 1
      current = current.next
    end
    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def visit
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity constant
  def delete(value)
    if @head == nil
      return nil
    end
    if @head.data == value
      @head = @head.next
    else
      current = @head
      while current.next != nil
        if current.next.data == value
          current.next = current.next.next
          break
        end
        current = current.next
      end
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity almost constant, needs three pointers allocated
  def reverse
    #going to need three pointers
    prev = nil
    current = @head
    while current != nil
      temp = current.next
      current.next = prev
      prev = current
      current = temp
    end
    @head = prev
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity:
  # Space Complexity
  def find_middle_value
    length = self.length
    return self.get_at_index(length / 2 - 1)
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n) + N
  # Space Complexity O(1)
  def find_nth_from_end(n)
    length = self.length
    if n > length
      return nil
    else
      return self.get_at_index(length - n - 1)
    end
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity:
  # Space Complexity
  def has_cycle
    # does this just mean an infinite loop?
    raise NotImplementedError
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity O(1)
  def get_first
    if @head == nil
      return nil
    end
    if @head.data != nil
      return @head.data
    else
      return nil
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity constant + 1?
  def add_last(value)
    puts value
    last = Node.new(value)
    if @head == nil
      @head = last
    else
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = last
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity constant
  def get_last
    return nil if @head == nil
    val = @head.data
    current = @head
    while current != nil
      val = current.data
      current = current.next
    end
    return val
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity:
  # Space Complexity
  def insert_ascending(value)
    raise NotImplementedError
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
