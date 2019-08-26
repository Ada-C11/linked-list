require "pry"
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
  # Time Complexity:
  # Space Complexity
  def add_first(value)
    if self.length != 0
      new_node = Node.new(value)
      current = @head
      @head = new_node
      @head.next = current
    else
      new_node = Node.new(value)
      @head = new_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:
  # Space Complexity
  def search(value)
    raise NotImplementedError
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity:
  # Space Complexity
  def find_max
    if self.length == 0
      return nil
    elsif self.length == 1
      return @head.data
    else
      current = @head
      max = current.data
      self.length.times do
        if current.data > max
          max = current.data
        end
        current = current.next
      end
      return max
    end
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity:
  # Space Complexity
  def find_min
    if self.length == 0
      return nil
    elsif self.length == 1
      return @head.data
    else
      current = @head
      min = current.data
      self.length.times do
        if current.data < min
          min = current.data
        end
        current = current.next
      end
      return min
    end
  end

  # method that returns the length of the singly linked list
  # Time Complexity:
  # Space Complexity
  def length
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
  # Time Complexity:
  # Space Complexity
  def get_at_index(index)
    if index > self.length
      return nil
    else
      i = 0
      current = @head
      until i == index
        current = current.next
        i += 1
      end
      return current.data
    end
  end

  # method to print all the values in the linked list
  # Time Complexity:
  # Space Complexity
  def visit
    raise NotImplementedError
  end

  # method to delete the first node found with specified value
  # Time Complexity:
  # Space Complexity
  def delete(value)
    if self.length == 0
      return
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
  # Time Complexity:
  # Space Complexity
  def reverse
    # get j to last node and i to second-to-last node
    # i = 0
    # j = 1
    # current = @head
    # after_current = @head.next
    # until j == self.length - 1
    #   current = current.next
    #   after_current = after_current.next
    #   i += 1
    #   j += 1
    # end

    # until i == 0
    #   after_current.next = current
    # end
    # reversed_list = LinkedList.new
    # self.length.times do
    #   i = self.length - 1
    #   until
    # end
    a = @head
    b = @head.next
    i = 1
    until i == self.length - 2
      b.next = a
      a = a.next
      b = a.next.next
      i += 1
    end
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
    if n >= self.length
      return nil
    end

    index_of_n = self.length - 1 - n
    i = 0
    current = @head
    until i == index_of_n
      current = current.next
      i += 1
    end
    return current.data
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
  # Time Complexity:
  # Space Complexity
  def get_first
    if self.length == 0
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:
  # Space Complexity
  def add_last(value)
    if self.length == 0
      new_node = Node.new(value)
      @head = new_node
    else
      # set head to last node
      current = @head
      while current.next != nil
        current = current.next
      end
      new_node = Node.new(value)
      current.next = new_node
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity:
  # Space Complexity
  def get_last
    if self.length == 0
      return nil
    else
      current = @head
      until current.next == nil
        current = current.next
      end
      return current.data
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
