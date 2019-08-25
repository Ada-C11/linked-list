
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
    # Space Complexity: O(n) where n is the number of nodes
    def add_first(value)
      if !@head 
        @head = Node.new(value)
      else 
        new_node = Node.new(value)
        new_node.next = @head
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
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def find_max
      return if !@head
      curr = @head
      max = curr.data
      while curr
        if max < curr.data 
          max = curr.data
        end
        curr = curr.next 
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def find_min
      return if !@head
      curr = @head
      min = curr.data
      while curr
        if min > curr.data 
          min = curr.data
        end
        curr = curr.next 
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def length
      count = 0
      curr = @head
      while curr && @head
        curr = curr.next
        count += 1
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def get_at_index(index)
      target_node = node_at_index(index)
      return if !target_node
      return target_node.data 
    end

    def node_at_index(index)
      length = length()
      return if length - 1 < index ||  index < 0
      curr = @head
      count = 0
      while index != count
        curr = curr.next
        count += 1
      end
      return curr
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      raise NotImplementedError
    end

    # method to delete the first node found with specified value
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def delete(value)
      return if !@head
      curr = @head
      if curr.data == value
        delete_first_node()
      else
        while curr.next
          if curr.next.data == value
            remove_next_node(curr)
          else
            curr = curr.next
          end
        end
      end
    end

    def delete_first_node
      temp = @head
      @head = @head.next
      temp.next = nil
    end

    def remove_next_node(node)
      temp = node.next 
      node.next = node.next.next
      temp.next = nil
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
      target_node = node_at_index(length() - n - 1)
      return if !target_node
      return target_node.data
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
    # Time Complexity:  O(1)
    # Space Complexity: O(n) where n is the number of nodes
    def get_first
      return @head.data if @head
      return 
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def add_last(value)
      last = get_last_node()
      new_node = Node.new(value)
      if last
        last.next = new_node
      else 
        @head = new_node
      end
      return true
    end

    def get_last_node
      return if !@head
      curr = @head
      while curr.next
        curr = curr.next
      end
      return curr
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  O(n) where n is the number of nodes
    # Space Complexity: O(n) where n is the number of nodes
    def get_last
      last_node = get_last_node()
      return last_node.data if last_node
      return
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
