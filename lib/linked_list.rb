
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
    # Time Complexity:  O(1) constant
    # Space Complexity: O(1) constant
    def add_first(value)
      # make a new node temp
      temp = Node.new(value, @head) # passing @head sets temp.next = @head
      @head = temp # set head pointer to new node temp
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) where n is the length of the list
    # Space Complexity: O(1)
    def search(value)
      return false if !@head

      current = @head

      until current == nil
        return true if current.data == value
        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n) linear, where n is the length of the list
    # Space Complexity:  O(1) constant
    def find_max
      return nil if !@head

      current = @head
      max = current.data # set max to current before the first loop

      until current == nil
        max = current.data if current.data > max
        current = current.next
      end

      return max

    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n) linear, where n is the length of the list
    # Space Complexity:  O(1) constant
    def find_min
      return nil if !@head

      min = nil
      current = @head

      min = current.data if min == nil # set min to current before the first loop

      until current == nil
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  O(n) linear, where n is the number of items in the list
    # Space Complexity: O(1) constant
    def length
      return 0 if @head == nil

      count = 1
      current = @head
      until current.next == nil
        current = current.next
        count += 1
      end

      return count

    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  O(n) linear, where n is the number of items in the list
    # Space Complexity:  O(1) constant
    def get_at_index(index)
      # return nil if !@head

      # ^^^^^^^ NOTE FOR CHRIS ^^^^^^^^
      # THIS CODE WOULD WORK FOR THE EXISTING TEST. I WROTE ANOTHER TEST TO
      # ENSURE CODE IS NEEDED TO CATCH AN OUT OF BOUNDS INDEX WHEN THE LIST
      # IS NOT EMPTY. SEE MY TEST FILE.

      current = @head
      count = 0
      until count == index
        if !current || !current.next
          return nil
        end
        current = current.next
        count += 1
      end

      return current.data

    end

    # method to print all the values in the linked list
    # Time Complexity:  O(n) linear, where the maximum value of n is the length of the list
    # Space Complexity:  O(1) constant
    def visit
      return if !@head
      current = @head
      until !current
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity:  O(n) linear, where the maximum value of n is the length of the list
    # Space Complexity:  O(1) constant
    def delete(value)
      # find the node with the given value

      # if list is empty
      return if !@head

      # if value is at beginning of list
      if @head.data == value
        @head = @head.next
        return
      end

      # if value is not at beginning of list
      current = @head
      until current.next.data == value
        current = current.next
      end

      current.next = current.next.next
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  O(n) where n is the length of the list
    # Space Complexity:  O(1)
    def reverse
      return nil if !@head

      current = @head

      until current.next == nil
        temp = current.next
        current.next = current.next.next
        temp.next = @head
        @head = temp # move temp to start, head now points to temp
      end

    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity:  O(n) linear, where the maximum value of n is the length of the list
    # Space Complexity:  O(1) constant
    def find_middle_value
      # two pointers, one moves twice as fast as the other
      # return value at first pointer when the second pointer == nil
      return nil if !@head # return nil if list is empty

      pointerA = @head
      pointerB = pointerA
      until !pointerB || !pointerB.next
        pointerA = pointerA.next
        pointerB = pointerB.next.next
      end

      return pointerA.data

    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity:  O(2n) linear => O(n), where n is the length of the list
    # Space Complexity:  O(1) constant
    def find_nth_from_end(n)
      return nil if !@head  # empty list

      # find length of list
      list_length = length

      return nil if n > list_length - 1 # if n is outside the list

      # subtract n from length of list - 1 to get its index
      node_index = list_length - 1 - n

      # if n <= length - 1, navigate to node at index; return current.data
      return get_at_index(node_index)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n) where n is the length of the list
    # Space Complexity: O(1)
    def has_cycle

      raise NotImplementedError

      # Option 1: O(n-squared) Time Complexity, O(2n) Space Complexity
      # - duplicate the list as you traverse it
      # - at each node in the original list, loop through the entire duplicated list checking if any of those nodes match the current node in the first list
      # - if there's a match, return true (found a cycle)
      # - if you get to the end of the first list with no matches, return false

      # Option 2: O(n) Time Complexity, O(2n) Space Complexity
      # - traverse the list
      # - at each node, store a copy of the node in a hash table
      # - check each node to see if it already exists in the hash table
      # - if it does, return true (found a cycle)
      # - if you get to the end of the first list with no matches, return false

    end


    # Additional Exercises
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity:  O(1)
    # Space Complexity:  O(1)
    def get_first
      return nil if !@head
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  O(n) where n is the length of the list
    # Space Complexity:  O(1)
    def add_last(value)
      if !@head
        add_first(value)
        return
      end

      current = @head
      current = current.next until !current.next

      temp = Node.new(value)
      current.next = temp

    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  O(n) where n is the length of the list
    # Space Complexity:  O(1)
    def get_last
      return nil if !@head

      current = @head
      current = current.next until !current.next

      return current.data

    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity:  O(n) where n is the length of the list
    # Space Complexity:  O(1)
    def insert_ascending(value)
      add_first(value) if !@head
      return if !value

      new_node = Node.new(value)
      current = @head

      add_first(value) if (new_node.data <= current.data)

      until !current.next || current.next.data > new_node.data
        current = current.next
      end

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
      current = current.next while current.next != nil
      current.next = @head # make the last node link to first node
    end
end
