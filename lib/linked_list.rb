
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
    temp_node = @head
    new_node = Node.new(value, temp_node)
    @head = new_node

    return @head.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    temp_node = @head
    while temp_node != null
      if temp_node.data == value
        return true
      end
      temp_node = temp_node.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    if @head == nil
      return @head
    end

    temp_node = @head
    max_value = temp_node.data
    while temp_node != nil
      if temp_node.data > max_value
        max_value = temp_node.data
      end
      temp_node = temp_node.next
    end
    return max_value
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    if @head == nil
      return @head
    end

    temp_node = @head
    min_value = temp_node.data
    while temp_node != nil
      if temp_node.data < min_value
        min_value = temp_node.data
      end
      temp_node = temp_node.next
    end
    return min_value
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    length = 0
    if @head == nil
      return length
    end

    temp_node = @head
    while temp_node != nil
      length += 1
      temp_node = temp_node.next
    end
    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    count = 0
    temp_node = @head
    while temp_node != nil
      if count == index
        return temp_node.data
      end
      temp_node = temp_node.next
      count += 1
    end
    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit
    if @head == nil
      puts ""
    end

    temp_node = @head
    while temp_node != nil
      put temp_node.data
      temp_node = temp_node.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    if @head == nil
      return
    end

    temp_node = @head

    # delete first node
    if temp_node.data == value
      @head = temp_node.next
      return
    end

    # delete nodes in the middle
    while temp_node != nil
      if temp_node.next != nil && temp_node.next.data == value
        temp_node.next = temp_node.next.next
      end
      temp_node = temp_node.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    if @head == nil || @head.next == nil
      return @head
    end

    prev = nil
    curr = @head
    while curr != nil
      temp = curr.next
      curr.next = prev
      prev = curr
      curr = temp
    end
    
    @head = prev
    return @head.data
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity:
  # Space Complexity
  def find_middle_value
    raise NotImplementedError
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    # find the length of the linked list
    if @head == nil
      return @head
    end

    temp_node = @head
    length = 0

    while temp_node != nil
      temp_node = temp_node.next
      length += 1
    end

    pos_from_beg = length - n - 1
    
    temp_node = @head
    idx = 0
    while temp_node != nil
      if idx == length - n - 1
        return temp_node.data
      end
      idx += 1
      temp_node = temp_node.next
    end
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def has_cycle
    slow = @head
    fast = @head
    while fast != nil && fast.next != nil
      slow = slow.next
      fast = fast.next.next
      if slow == fast
        return true
      end
    end
    return false
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity:
  # Space Complexity: 
  def get_first
    return @head == nil ? @head : @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    new_node = Node.new(value)
    if @head == nil
      @head = new_node
      return @head.data
    end

    temp_node = @head
    while temp_node != nil
      if temp_node.next == nil
        temp_node.next = new_node
        return new_node.data
      end
      temp_node = temp_node.next
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last
    if @head == nil 
      return @head
    end

    temp_node = @head
    while temp_node != nil
      if temp_node.next == nil
        return temp_node.data
      end
      temp_node = temp_node.next
    end
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