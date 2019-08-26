
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
  # Space Complexity O(1)
  def add_first(value)
    @head = Node.new(value, @head) # i don't fully understand why next_node is @head

    return @head.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def search(value)
    current = @head

    while current
      return true if current.data == value
      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def find_max
    current = @head

    return nil unless current

    max_value = current.data

    while current
      max_value = current.data > max_value ? current.data : max_value
      current = current.next
    end

    return max_value
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def find_min
    current = @head

    return nil unless current

    min_value = current.data

    while current
      min_value = current.data < min_value ? current.data : min_value
      current = current.next
    end

    return min_value
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def length
    return 0 unless @head

    length = 0

    current = @head
    while current
      current = current.next
      length += 1
    end

    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n), where n is the value of the index
  # Space Complexity: O(1)
  def get_at_index(index)
    return nil unless @head

    current = @head
    
    index.times do
      current = current.next

      return nil unless current
    end

    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1), unless printing takes space?
  def visit
    return nil unless @head

    current = @head

    while current
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def delete(value)
    # if the value doesn't exist, just return the list
    return self unless self.search(value)

    # delete the value if at the head
    if @head.data == value
      @head = @head.next ? @head.next : nil
      return
    end

    # delete value somewhere else
    previous = @head
    current = @head.next
    while current
      if current.data == value
        previous.next = current.next ? current.next : nil
      end
      current = current.next
      previous = previous.next
    end

    return self
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)?
  def reverse
    return nil unless @head
    return self if self.length < 2

    temporary = nil
    previous = nil
    current = @head
    puts self.visit

    # printing things to try to trace what's happening
    while current
      puts "------------"
      puts "temporary: #{temporary.data if temporary}"
      puts "previous: #{previous.data if previous}"
      puts "current: #{current.data}"
      puts "next: #{current.next.data if current.next}"
      puts "list: #{self.visit}"
      temporary = current.next
      current.next = previous
      previous = current
      current = temporary

      # puts "temporary: #{temporary.data if temporary}"
      # puts "previous: #{previous.data}"
      # puts "current: #{current.data if current}"
      # puts "next: #{current.next.data if current && current.next}"
    end
    
    @head = previous

    puts self.visit
    return self
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
  # Time Complexity: O(n-m), where n is the length of the list and m is the index
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    return nil if self.length - 1 < n

    self.get_at_index(self.length - 1 - n)
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
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    return @head ? @head.data : nil
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def add_last(value)
    if @head
      current = @head

      while current.next
        current = current.next
      end

      return current.next = Node.new(value)
    else
      self.add_first(value)

      return @head
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n), where n is the length of the list
  # Space Complexity: O(1)
  def get_last
    return nil unless @head

    current = @head
    current = current.next while current.next

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
