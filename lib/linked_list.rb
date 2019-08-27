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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
  def search(value)
    if self.length == 0
      return false
    end

    current = @head
    (self.length - 1).times do
      if current.data == value
        return true
      else
        current = current.next
      end
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
  def visit
    if self.length == 0
      return nil
    end

    current = @head
    (self.length - 1).times do 
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
  def reverse
    previous = nil
    current = @head
    after = @head.next
    while current != nil
      after = current.next
      current.next = previous 
      previous = current
      current = after
    end
    @head = previous
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n) where n is number of nodes in the list
  # Space Complexity: O(1)
  def find_middle_value
    if self.length == 0
      return nil
    end

    middle = self.length / 2

    middle_value = self.get_at_index(middle)
    return middle_value
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
  def has_cycle
    if self.length <= 1
      return false
    end

    a = @head
    b = @head.next
    while a != nil
      if a == b
        return true
      else
        a = a.next
        b = b.next
      end
    end

    # Got help from https://www.geeksforgeeks.org/detect-and-remove-loop-in-a-linked-list/
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    if self.length == 0
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
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
  # Time Complexity: O(n) where n is the number of nodes in the list
  # Space Complexity: O(1)
  def insert_ascending(value)
    if self.length == 0
      self.add_first(value)
    end

    current = @head
    until current.next == nil
      if current.next.data >= value
        break
      else
        current = current.next
      end
    end

    new_node = Node.new(value)
    new_node.next = current.next
    current.next = new_node
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
