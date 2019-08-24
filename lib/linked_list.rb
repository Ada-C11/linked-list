
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = nil
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: Constant
  # Space Complexity: Constant
  def add_first(value)
    new_node = Node.new(value)

    if @head != nil #if list isn't empty
      new_node.next = @head
    end

    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: o(n) where n is the length of the linked list because this method iterates through each node to find the value
  # Space Complexity: constant, no extra space needed
  def search(value)
    if @head == nil
      return false
    end

    current = @head
    while @next != nil
      if current.data == value
        return true
      end
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def find_max
    return nil if @head == nil

    current = @head
    max = current.data

    while current.next != nil
      if current.data > max
        max = current.data
      end
      current = current.next
    end

    if current.data > max
      max = current.data
    end

    return max
    # raise NotImplementedError
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def find_min
    return nil if @head == nil
    min = @head.data
    current = @head
    while current.next != nil
      if current.data < min
        min = current.data
      end
      current = current.next
    end

    if current.data < min
      min = current.data
    end
    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def length
    count = 0

    return count if @head == nil

    current = @head

    while current.next != nil
      count += 1
      current = current.next
    end

    return count + 1
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def get_at_index(index)
    return nil if @head == nil

    current = @head
    count = 0

    until count == index
      return nil if current.next == nil
      current = current.next
      count += 1
    end
    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def visit
    current = @head
    while current.next != nil
      puts current.data
    end
    puts current.data
  end

  # method to delete the first node found with specified value
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def delete(value)
    #head is nil
    return nil if @head == nil

    #head is node to delete
    if @head.data == value
      @head = @head.next
      return
    end

    current = @head
    while current.next != nil
      if current.next.data == value
        current.next = current.next.next
        return
      end
      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: 0(n) where n is length of linked list bc we are checking each node
  # Space Complexity: constant, extra space needed for variables does not grow as the size of the LL grows
  def reverse
    current = @head
    prev = nil

    while current != nil
      nextNode = current.next
      current.next = prev
      prev = current
      current = nextNode
    end
    @head = prev
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
  # Time Complexity:
  # Space Complexity
  def find_nth_from_end(n)
    #copied from solution branch so tests for reverse could run
    # approach with going through the linked list just once
    current = @head
    index = 0
    # count to n from the beginning
    while current != nil && index != n
      current = current.next
      index += 1
    end

    # check that we didn't reach the end
    if current == nil
      # puts "Error: The linked list has less than #{n} indexable nodes"
      return nil
    end

    # the previous while loop exited because of index == n condition
    # start a new traverser at the beginning.
    # when current reaches the end, new_current will be at index n from the end
    new_current = @head
    while current.next != nil
      current = current.next
      new_current = new_current.next
    end
    return new_current.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity:
  # Space Complexity
  def has_cycle
    raise NotImplementedError
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity:Constant, no matter the size of the LL, only have to look at first node
  # Space Complexity: Constant
  def get_first
    if @head == nil
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n) where n is length of LL bc you have to iterate through entire LL
  # Space Complexity: Constant
  def add_last(value)
    new_node = Node.new(value)

    if @head == nil
      @head = new_node
    else
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = new_node
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n) because you have to iterate through the entire LL
  # Space Complexity: Constant
  def get_last
    return nil if @head == nil
    current = @head
    until current.next == nil
      current = current.next
    end
    return current.data
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
