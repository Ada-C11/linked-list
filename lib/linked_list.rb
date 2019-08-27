
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
    node = Node.new(value, @head)
    @head = node
    return @head.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    current_node = @head
    until current_node.data == nil
      if current_node.data == value
        return true
      else
        current_node = current_node.next
      end
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    return @head if @head == nil

    current_node = @head
    max = @head.data
    
    until current_node == nil
      if current_node.data > max
        max = current_node.data
        current_node = current_node.next
      else
        current_node = current_node.next
      end
    end 

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    return @head if @head == nil

    current_node = @head
    min = @head.data
    
    until current_node == nil
      if current_node.data < min
        min = current_node.data
        current_node = current_node.next
      else
        current_node = current_node.next
      end
    end 

    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    return 0 if @head == nil

    current_node = @head
    length = 1
      
    until current_node.next == nil
      length += 1
      current_node = current_node.next
    end

    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    return nil if @head == nil

    current_node = @head

    index.times do
      if current_node.next == nil
        return nil
      else
        current_node = current_node.next
      end
    end 

    return current_node.data
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit
    return nil if @head == nil
    current_node = @head

    until current_node == nil
      puts current_node.data
      current_node = current_node.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    return nil if @head == nil

    current_node = @head

    # handles head case
    if current_node.data == value
      @head = current_node.next
    else
      until current_node == nil
          if current_node.next != nil && current_node.next.data == value
            current_node.next = current_node.next.next
            return
          end
          current_node = current_node.next
      end
    end 
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    previous_node = nil
    current_node = @head
    next_node = nil

    until current_node == nil
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end

    @head = previous_node
    return self
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_middle_value
    index = self.length / 2
    if index > -1
      return self.get_at_index(index)
    else 
      return nil
    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: 0(2n) --> O(n)
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    if n == 0
      return self.get_last
    elsif n == self.length - 1
      return self.get_first
    else
      index = (self.length - 1) - n
      if index > -1
        return self.get_at_index(index)
      else
        return nil
      end
    end
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def has_cycle
    move_by_one = @head
    move_by_two = @head

    until move_by_two == nil && move_by_two.next == nil
      move_by_one = move_by_one.next
      move_by_two = move_by_two.next.next
      return true if move_by_one == move_by_two
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
  # Time Complexity: O(n)
  # Space Complexity: 
  def add_last(value)
    if @head
      current_node = @head
      until current_node.next == nil
        current_node = current_node.next
      end
      
      current_node.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity:
  # Space Complexity
  def get_last
    return nil if @head == nil

    current_node = @head

    until current_node.next == nil
      current_node = current_node.next
    end

    return current_node.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity:
  # Space Complexity
  def insert_ascending(value)
    current_node = @head

    if current_node.data > value
      @head = Node.new(value)
      @head.next = current_node
    else
      until current_node == nil
        if current_node.data <= value && current_node.next.data > value
          holder = current_node.next
          current_node.next = Node.new(value)
          current_node.next.next = holder
        else
          current_node = current_node.next
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
