
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
  # Time Complexity:  O(1), because this method doesn't require any traversal
  # Space Complexity:  O(1), because this will always result in the same number of additional nodes
  def add_first(value)
    new_node = Node.new(value, nil)

    new_node.next = @head
    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:  O(n), where n equals the number of nodes inside the list
  # Space Complexity:  O(1), because this method requires no additional space (outside of the variables declared)
  def search(value)
    return false if @head == nil

    current = @head

    until current.next == nil
      return true if value == current.data

      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method requires no additional space (outside of the variables declared)
  def find_max
    return nil if !@head

    current = @head.next
    max = @head.data

    until !current
      max = current.data if current.data > max
      current = current.next
    end

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity:  O(n), where n is the number of nodes inside the list
  # Space Complexity:  O(1), because this method doesn't require any additional space (outside of the variables declared)
  def find_min
    return nil if !@head

    current = @head.next
    min = @head.data

    until !current
      min = current.data if current.data < min
      current = current.next
    end

    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require any additional space (outside of the variables declared)
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
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require any additional space (outside of the variables declared)
  def get_at_index(index)
    return nil if !@head
    return @head.data if index == 0

    current = @head.next
    count = 1

    until !current || count == index
      current = current.next
      count += 1
    end

    if index > count
      return nil
    else
      return current.data
    end
  end

  # method to print all the values in the linked list
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require any additional storage (outside of the variables declared)
  def visit
    return if @head == nil

    current = @head

    until current.next == nil
      puts current.value

      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity:  O(n), where n is the number of nodes traversed to find the value
  # Space Complexity:  O(1), because this method doesn't require additional storage (outside of existing variables)
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
  # Time Complexity: O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require additional storage (outside of existing variables)
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
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity: O(1), because this method doesn't require additional storage (outside of existing variables)
  def find_middle_value
    fast = @head
    slow = @head
    count = 0

    until fast == nil
      fast = fast.next
      count += 1
    end

    middle = count / 2

    middle.times do
      slow = slow.next
    end

    return slow.data
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require additional storage (outside of existing variables)
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
    if !@head
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:  O(n), where n is the number of nodes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require additional storage (outside of existing variables)
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
  # Time Complexity:  O(n), where n is the number of ndoes inside the linked list
  # Space Complexity:  O(1), because this method doesn't require additional storage (outside of existing variables)
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
