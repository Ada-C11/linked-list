
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
    if @head == nil
      @head = Node.new(value)
    else
      add_node = Node.new(value, @head)
      @head = add_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n), n is the number of nodes in the LL
  # Space Complexity: O(1)
  def search(value)
    if @head == nil
      return false
    end

    current = @head

    until current.next == nil
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
  # Time Complexity: O(n), n is the number of nodes in the LL
  # Space Complexity: O(1)
  def find_max
    return nil if @head == nil

    current = @head
    max = current.data

    until current.next == nil
      if current.data > max
        max = current.data
      end
      current = current.next
    end

    if current.data > max
      max = current.data
    end

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity:
  # Space Complexity
  def find_min
    if @head == nil
      return nil
    end

    current = @head
    min = current.data

    until current.next == nil
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
  # Time Complexity: O(n), n is the number of nodes in the LL
  # Space Complexity: O(1)
  def length
    count_length = 0

    return count_length if @head == nil
    
    current = @head

    until current.next == nil
      count_length += 1
      current = current.next
    end

    return count_length + 1


  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n), n is the length of the list
  # Space Complexity: O(1)
  def get_at_index(index)

    return nil if @head == nil

    current = @head
    counter = 0

    until counter == index
        if current.next == nil
          return nil
        else
          current = current.next
          counter += 1
        end
    end
    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity:
  # Space Complexity
  def visit
     current = @head

     until current.next == nil
      puts current.data
      current = current.next
     end
     puts current.data
    
  end

  # method to delete the first node found with specified value
  # Time Complexity:
  # Space Complexity
  def delete(value)
    
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity:
  # Space Complexity
  def reverse
    raise NotImplementedError
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
    if @head == nil
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:
  # Space Complexity
  def add_last(value)
    # new_node = Node.new(value)
    # if @head == nil
    #   @head = new_node
    # else
    #   current = @head
    #   until current.next == nil
    #     current = current.next
    #   end
    #   current = new_node
    # end

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


