
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node=nil)
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
    # Time Complexity: O
    # Space Complexity O
    def add_first(value)
      new_node = Node.new(value, @head)
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O
    def search(value)
      current = @head

      while current
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
    # Time Complexity:  O(n)
    # Space Complexity: O
    def find_max
      visited_node = @head
      return nil if visited_node == nil

      max = visited_node.data

      while visited_node != nil
        if visited_node.data  > max
          max = visited_node.data
        end
        visited_node = visited_node.next
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  O(n)
    # Space Complexity: O
    def find_min
      return nil if @head == nil

      visited_node = @head
      min = visited_node.data

      while visited_node != nil
        if visited_node.data  < min
          min = visited_node.data
        end
        visited_node = visited_node.next
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O
    def length
      count = 0
      current = @head

      if @head == nil
        return 0
      else
        until current == nil
          current = current.next
          count += 1
        end
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  O(n)
    # Space Complexity: O
    def get_at_index(index)
      current = @head

      return nil if @head == nil
      count = 0

      while count < index && current.next != nil
        current = current.next
        count += 1
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      current = @head
      
      while current.next != nil
        puts @current.data
        current = current.next
      end
      # for last node
      puts current.data
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity O
    def delete(value)
      current = @head
      unless current
        return 0
      end

      # if head node has the value to delete
      if current.data == value
        @head = current.next
      end

      while current.next != nil
        if current.next.data == value
          current.next = current.next.next
        end
        current = current.next
      end
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
      return @head if @head.nil?

      first_node = @head
      return first_node.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:O(n)
    # Space Complexity
    def add_last(value)
      last_node = Node.new(value)
      current = @head

      if @head == nil
        @head = last_node
      else
        while current.next != nil
          current = current.next
        end
        current.next = last_node
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  
    # Space Complexity
    def get_last
      count = 0
      current = @head
      if !current
        return nil
      end

      while current.next != nil
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
