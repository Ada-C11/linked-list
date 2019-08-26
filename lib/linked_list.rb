
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
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
  def visit
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity:
  # Space Complexity
  def delete(value)
    # if self.length != 0
    #   if @head.data == value
    #     if @head.next != nil
    #       @head = @head.next
    #     else
    #       @head = nil
    #     end
    #   current = @head
    #   while current.next != nil
    #     if current.data == value
    #       current = current.next
    #     end
    #     length += 1
    #     current = current.next
    #   end
    # end
    # return nil
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity:
  # Space Complexity
  def reverse
    temp = @head
    puts "temp #{temp} @head #{@head}"
    puts "length #{self.length}"
    # while temp.next != nil
    #   @head = temp.next
    #   puts "temp #{temp} @head #{@head} temp.next #{temp.next} @head.next #{@head.next}"
    #   @head.next = temp
    #   temp = temp.next
    #   puts "temp #{temp} @head #{@head} temp.next #{temp.next} @head.next #{@head.next}"
    # end
    # temp = @head
    # puts "temp #{temp} @head #{@head}"
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
    end
    if @head.data != nil
      return @head.data
    else
      return nil
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:
  # Space Complexity
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
  # Time Complexity:
  # Space Complexity
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
