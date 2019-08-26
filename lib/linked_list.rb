
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
  # Time Complexity:O(1)
  # Space Complexity:O(1)
  def add_first(value)
    # raise NotImplementedError
    if @head
      temp_node = @head
      new_node = Node.new(value, temp_node)
      @head = new_node
    else
      @head = Node.new(value)
    end
    return @head.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def search(value)
    # raise NotImplementedError
    if !@head
      return false
    else
      current_node = @head
      while current_node != nil
        if current_node.data == value
          return true
        else
          current_node = current_node.next
        end
      end
      return false
    end
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def find_max
    #  raise NotImplementedError
    if !@head
      return nil
    else
      current_node = @head
      max = current_node.data
      while current_node != nil
        if current_node.data > max
          max = current_node.data
        end
        current_node = current_node.next
      end
      return max
    end
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def find_min
    # raise NotImplementedError
    if !@head
      return nil
    else
      current_node = @head
      min = current_node.data
      while current_node != nil
        if current_node.data < min
          min = current_node.data
        end
        current_node = current_node.next
      end
      return min
    end
  end

  # method that returns the length of the singly linked list
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def length
    # raise NotImplementedError
    if !@head
      return 0
    else
      i = 0
      current_node = @head
      while current_node != nil
        i += 1
        current_node = current_node.next
      end
      return i
    end
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def get_at_index(index)
    #  raise NotImplementedError
    return if !@head
    i = 0
    current_node = @head
    until i == index
      current_node = current_node.next
      i += 1
    end
    return current_node.data
  end

  # method to print all the values in the linked list
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def visit
    # raise NotImplementedError
    current_node = @head
    while current_node != nill
      puts "Node value #{current_node.data}"
      current_node = current_node.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def delete(value)
    #raise NotImplementedError
    current = @head
    before = nil
    while current
      if current.data == value
        if !before && !current.next
          @head = nil
        elsif !before
          @head = current.next
        else
          before.next = current.next
        end
        return "deleted"
      end
      before = current
      current = current.next
    end
    return nil
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def reverse
    # raise NotImplementedError
    return if @head == nil or @head.next == nil

    first = @head
    second = first.next
    third = second.next
    first.next = nil

    until third.nil?
      second.next = first
      first = second
      second = third
      third = third.next
    end
    second.next = first
    @head = second
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def find_middle_value
    # raise NotImplementedError
    if !@head
      return nil
    else
      l = self.length
      j = l / 2
      current = @head
      (j - 1).times do
        current = current.next
      end
      retrun current.data
    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def find_nth_from_end(n)
    # raise NotImplementedError
    if !@head || (n >= self.length)
      return nil
    else
      l = self.length
      i = l - (n + 1)
      current = @head
      i.times do
        current = current.next
      end
      return current.data
    end
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
  # Time Complexity:O(1)
  # Space Complexity:O(1)
  def get_first
    # raise NotImplementedError
    if @head
      return @head.data
    else
      return nil
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def add_last(value)
    # raise NotImplementedError
    if @head
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity:O(n)
  # Space Complexity:O(1)
  def get_last
    # raise NotImplementedError
    if !@head
      return nil
    else
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
    end
    return current_node.data
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
