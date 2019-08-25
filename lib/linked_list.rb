
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
  # Time Complexity: O(1) Where n is the length. No matter how long the lsit is, adding to the front takes the same amout of time
  # Space Complexity: O(1) WHere n is the length. The only extra space that is taken up is the new node, which is constant no matter the saize of the list.
  def add_first(value)
    node = Node.new(value)
    if @head != nil
      node.next = @head
    end
    @head = node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:  O(n) where n is the length of the list. Worst case scenario, we have to look at each node in the list. best case is O(1)
  # Space Complexity: O(1), regardless of the length of the list, the only extra space we use is a constant variable.
  def search(value)
    current = @head
    until current == nil
      return true if current.data = value
    end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) where n is the length of the list. We will ahve to visit each node exactly once
  # Space Complexity: O(1) We only use constant size variables
  def find_max
    max = nil
    current = @head
    until current == nil
      max = current.data if max == nil || current.data > max
      current = current.next
    end
    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) where n is the length of the list. We will ahve to visit each node exactly once
  # Space Complexity: O(1) We only use constant size variables
  def find_min
    min = nil
    current = @head
    until current == nil
      min = current.data if min == nil || current.data < min
      current = current.next
    end
    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n) where n is the length of the list. We will ahve to visit each node exactly once
  # Space Complexity: O(1) We only use constant size variables
  def length
    return 0 if @head.nil?
    ll_length = 0
    current = @head
    until current.nil?
      current = current.next
      ll_length += 1
    end
    return ll_length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity:  O(n) where n is the length of the list. Worst case scenario, we have to look at each node in the list. best case is O(1)
  # Space Complexity: O(1), regardless of the length of the list, the only extra space we use is a constant variable.
  def get_at_index(index)
    return nil if @head.nil?
    current = @head

    index.times do
      current = current.next
      return nil if current.nil?
    end
    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n) where n is the length of the list. We will have to visit each node exactly once
  # Space Complexity: O(1) We only use a constant size variable
  def visit
    current = @head
    until current == nil
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity:  O(n) where n is the length of the list. Worst case scenario, we have to look at each node in the list. best case is O(1)
  # Space Complexity: O(1), regardless of the length of the list, the only extra space we use is a constant variable.
  def delete(value)
    return if @head == nil

    current = @head
    @head = current.next if current.data == value

    until current.next == nil
      if current.next.data == value
        current.next = current.next.next
        return
      end
      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n) where n is the length of the list. We only loop through the list once, and perform a constant number of steps at each node.
  # Space Complexity: O(1) we only use 3 constant sized variables no matter how long the list is
  def reverse
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
  # Time Complexity: O(n) where n is the length of the list. The fast variable visits each node once.
  # Space Complexity: O(1) We only use constant sized variables
  def find_middle_value
    # Currently if the list is an even length it returns the left of the two middle nodes, but this could be easily changed.
    return nil if @head.nil?
    fast = @head.next
    slow = @head
    i = 0
    until fast.nil?
      slow = slow.next if i % 2 == 1
      fast = fast.next
      i += 1
    end
    return slow.data
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n) where n is the length of the list. Worst case scenario we visit each node once
  # Space Complexity: O(1) We only use constant sized variables

  def find_nth_from_end(n)
    return if @head.nil?

    lead = @head
    n.times do
      lead = lead.next
      return nil if lead.nil?
    end

    current = @head
    until lead.next.nil?
      current = current.next
      lead = lead.next
    end

    return current.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n) where n is the length of the list.
  # Space Complexity: O(1) We only use constant sized variables
  def has_cycle
    return false if @head.nil?
    fast = @head.next
    slow = @head
    i = 0
    until fast.nil?
      slow = slow.next if i % 2 == 1
      fast = fast.next
      i += 1
      return true if fast == slow
    end
    return false
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    if @head
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n) where n is the length of the list. We will have to visit each node exactly once
  # Space Complexity: O(1) We only use a constant sized variables
  def add_last(value)
    node = Node.new(value)
    current = @head
    if @head == nil
      @head = node
      return
    end
    current = get_last_node(current)
    current.next = node
  end

  def get_last_node(node)
    until node.next == nil
      node = node.next
    end
    return node
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n) where n is the length of the list. We will have to visit each node exactly once
  # Space Complexity: O(1) We only use a constant size variable
  def get_last
    return nil if @head == nil
    current = @head
    current = get_last_node(current)
    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n) where n is the length of the list, worst case we have to visit each node once
  # Space Complexity: O(1) we only use constant size variables
  def insert_ascending(value)
    node = Node.new(value)
    current = @head

    if @head.nil?
      @head = node
      return
    elsif current.data > value
      node.next = current
      @head = node
      return
    end

    until current.next.nil? || current.next.data > value
      current = current.next
    end

    node.next = current.next unless current.next.nil?
    current.next = node
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
