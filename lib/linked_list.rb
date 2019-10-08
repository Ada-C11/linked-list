
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
    new_node = Node.new(value, @head)
    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    current = @head

    until current.next == nil
      return true if value == current.data

      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    return nil if !@head

    current = @head.next
    max_value = @head.data

    until !current
      max_value = current.data if current.data > max_value
      current = current.next
    end

    return max_value
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def find_min
    return nil if !@head

    current = @head.next
    min_value = @head.data

    until !current
      min_value = current.data if current.data < min_value
      current = current.next
    end

    return min_value
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    return 0 if !@head

    count = 1
    current = @head.next

    until !current
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
    count = 0
    current = @head
    while current != nil
      if count == index
        return current.data
      end
      current = current.next
      count += 1
    end
    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def visit
    return if @head == nil

    current = @head

    until current.next == nil
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    return if !@head

    if @head.data == value
      @head = @head.next
      return
    end

    previous = @head
    current = @head.next

    until value == current.data || !current
      previous = current
      current = current.next
    end

    previous.next = current.next
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    return nil if @head == nil

    current = @head
    next_node = nil
    previous_node = nil

    until current == nil
      next_node = current.next
      current.next = previous_node
      previous_node = current
      current = next_node
    end

    @head = previous_node
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_middle_value
    fast = @head
    slow = @head

    while fast != nil && fast.next != nil
      slow = slow.next
      fast = fast.next.next
      if fast.next == nil
        return slow.data
      end
    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    return nil if @head == nil

    fast = @head
    slow = @head
    count = 0

    until count == n
      fast = fast.next
      return nil if fast == nil
      count += 1
    end

    until fast.next == nil
      fast = fast.next
      slow = slow.next
    end

    return slow.data
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
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_first
    return nil if !@head

    @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    return self.add_first(value) if !@head

    new_node = Node.new(value)

    current = @head

    until !current.next
      current = current.next
    end

    current.next = new_node
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last
    return nil if !@head
    return @head.data if !@head.next

    current = @head.next

    until !current.next
      current = current.next
    end

    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def insert_ascending(value)
    new_node = Node.new(value)
    if @head == nil
      @head = new_node
      return @head.data
    end

    if @head.data > new_node.data
      temp_node = @head
      @head = new_node
      new_node.next = temp_node
      return @head.data
    end

    curr_node = @head
    while curr_node != nil
      if curr_node.data <= new_node.data && curr_node.next.data > new_node.data
        temp_node = curr_node.next
        curr_node.next = new_node
        new_node.next = temp_node
        return new_node.data
      end
      curr_node = curr_node.next
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
