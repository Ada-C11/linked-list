
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
    # Time Complexity:  constant    
    # Space Complexity  constant
    def add_first(value)
      new_node = Node.new(value)
      if @head != nil
        new_node.next = @head
      end

      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity:  O(n)
    # Space Complexity  constant
    def search(value)
      if @head == nil
      return false 
      end

      current = @head
      while @next != nil
        if current.next == value 
          return true 
        end
      end
      return false 
    end 

    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: constant 
    def find_max
      return nil if @head == nil 

      max_value = current.data
      current = @head

      while current.next != nil
        if current.data > max_value 
          max_value = current.data
        end
        current = current.next 
      end 

      if current.data > max_value
        max_value = current.data
      end 

      return max_value

    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) 
    # Space Complexity: constant 
    def find_min
      #raise NotImplementedError
      return nil if @head == nil 
      min_value = @head.data
      current = @head

      while current.next != nil
        if current.data < min_value 
          min_value = current.data
        end
        current = current.next
      end

      if current.data < min_value
        min_value = current.data
      end
      return min_value

    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: constant 
    def length
      #raise NotImplementedError
      count = 0 

      return count if @head == nil 

      current = @head 

      while current.next != nil
      count += 1
      current = current.next 
      end 

      return count + 1
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  O(n)
    # Space Complexity: comstamt 
    def get_at_index(index)
      #raise NotImplementedError
      return nil if @head == nil 

      current = @head 
      count = 0 

      until count == index
        return nil if current.next == nil 
        current = current.next 
        count += 1
      end 
      return current.data  
    end

    # method to print all the values in the linked list
    # Time Complexity:  O(n)
    # Space Complexity: constant 
    def visit
      #raise NotImplementedError
      current = @head
      while current.next != nil
       puts current.data
      end
      
      puts current.data

    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: constant
    def delete(value)
      #raise NotImplementedError
      return nil if @head == nil

      if @head.data == value
      @head = @head.next
      return
      end

      current = @head
      while current.next != nil
      if current.next.data == value
      current.next = current.next.next
      return
      end
      current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n) 
    # Space Complexity: constant 
    def reverse
      #raise NotImplementedError
      current = @head
      previous_node = nil

      while current != nil
      nextNode = current.next
      current.next = previous_node
      previous_node = current
      current = nextNode
      end
      @head = previous_node
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
      #raise NotImplementedError
      current = @head
      index = 0
    
      while current != nil && index != n
      current = current.next
      index += 1

      if current == nil
      return nil
      end

      new_current = @head
      while current.next != nil
      current = current.next
      new_current = new_current.next
      end
      return new_current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: 
    # Space Complexity: 
    def has_cycle
      raise NotImplementedError
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity:  Constant
    # Space Complexity: constant
    def get_first
      #raise NotImplementedError
      if @head == nil
        return nil
      else
        return @head.data
      end
  
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  O(n)
    # Space Complexity: constant
    def add_last(value)
      #raise NotImplementedError
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
    # Time Complexity:  O(n)
    # Space Complexity: constant
    def get_last
      #raise NotImplementedError
      return nil if @head == nil
    current = @head
    until current.next == nil
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
