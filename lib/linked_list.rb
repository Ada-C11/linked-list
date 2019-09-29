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
  # Time Complexity: O(1), no need to traverse
  # Space Complexity: O(1)
  def add_first(value)
    node = Node.new(value, @head)
    @head = node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def search(value)
    current = @head
    until !current
      if current.data == value
        return true
      end
      current = current.next
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity O(1)
  def find_max
    temp_node = @head
    if temp_node == nil
      return nil
    end
    temp_max = temp_node.data
    until temp_node == nil
      if temp_node.data > temp_max
        temp_max = temp_node.data
      end
      temp_node = temp_node.next
    end

    return temp_max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def find_min
    temp_node = @head
    if temp_node == nil
      return nil
    end

    temp_min = temp_node.data
    until temp_node == nil
      if temp_node.data < temp_min
        temp_min = temp_node.data
      end
      temp_node = temp_node.next
    end
    return temp_min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def length
    counter = 0
    temp = @head
    if @head == nil
      return counter
    else
      until (temp == nil)
        temp = temp.next
        counter += 1
      end
    end
    return counter
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def get_at_index(index)
    temp_node = @head
    counter = 0

    until counter == index
      if temp_node == nil && counter < index
        return nil
      end

      temp_node = temp_node.next
      counter += 1
    end
    return temp_node.data
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def visit
    current = @head
    if !current
      puts "There are no values to print"
    else
      until !current
        puts current.value
        current = current.next
      end
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity O(1)
  def delete(value)
    temp_node = @head
    return if temp_node == nil

    if temp_node.data == value
      @head = temp_node.next
      return
    end

    until temp_node.next == nil
      temp_next = temp_node.next
      if temp_next.data == value
        temp_node.next = temp_next.next
        return
      end
      temp_node = temp_next
    end
    return
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n), we may need to traverse all nodes
  # Space Complexity: O(1)
  def reverse
    current = @head
    prev = nil

    while current
      temp = current.next
      current.next = prev
      prev = current
      current = temp
    end
    @head = prev
    return
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
    raise NotImplementedError
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
    raise NotImplementedError
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:  
  # Space Complexity
  def add_last(value)
    raise NotImplementedError
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity:  
  # Space Complexity
  def get_last
    raise NotImplementedError
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