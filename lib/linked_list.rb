
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
      new_node = Node.new(value, @head)
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity:  
    # Space Complexity
    def search(value)
      current = @head
      while current
        if current.data == value
          return true
        end
        current = current.next
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
     current = @head
     max = current.data
     while current
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
      current = @head
      min = current.data
      while current
       if current.data < min
         min = current.data
       end
       current = current.next
       end
       return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  
    # Space Complexity
    def length
      count = 0
      current = @head
      while current
        count += 1
        current = current.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  
    # Space Complexity
    def get_at_index(index)
      count = 0
      current = @head
      while current
        if count == index
          return current.data
        elsif count > index
          return nil
        end
        current = current.next
        count += 1
      end
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      values = []
      current = @head
      while current != nil
        values.push(current.data)
        current = current.next
      end
      return values
    end

    # method to delete the first node found with specified value
    # Time Complexity:  
    # Space Complexity
    def delete(value)
      current = @head
      before = nil
      while current
        if current.data == value
          if !before && !current.next
            @head = nil
          elsif !before
            @head = current.next
          else
            before.next = current.next
          end
          return "deleted"
        end
        before = current
        current = current.next
      end
      return nil
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  
    # Space Complexity
    def reverse
      current = @head
      before = nil
      after = nil

      while current
        current.next = before
        before = current
        current = current.next
      end
      @head = before

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
      selected_index = length - n - 1
      
      if n >= length 
        return nil
      end
      current = @head
      i = 0
        while i < selected_index && current.next
          current = current.next
          i += 1
        end
        return current.data
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
      if @head
        return @head.data
      else
        return nil
      end
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  
    # Space Complexity
    def add_last(value)
    
      new_node = Node.new(value, nil)
      current = @head
      if @head == nil
        @head = new_node
        return
      else 
        while current != nil
          if current.next == nil
            current.next = new_node
            return 
          end
        current = current.next
        end
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  
    # Space Complexity
    def get_last
      current = @head
      while current != nil
        if current.next == nil
          return current.data
        end
        current = current.next
      end
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
