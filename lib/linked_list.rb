require 'pry'

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
      @tail = nil
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1) constant - because you are only redirecting the head to the new node.
    # Space Complexity: 
    def add_first(value)
      new_node = Node.new(value, @head)

      if !@head
        @tail = new_node
      end
      @head = new_node
      # current = @head
      # while current.next
      #   current = current.next
      # end
      # @tail = current

      print @head.data
    end

    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity:  
    # Space Complexity
    def get_first
      if @head
        return @head.data
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity:  
    # Space Complexity
    def length
      current = @head
      length = 0

      while current
        length += 1
        current = current.next
      end

      return length
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  
    # Space Complexity
    def add_last(value)
      new_node = Node.new(value)
      @tail = new_node
      
      if !@head
        @head = new_node
      else 
        current = @head 
        while current.next
          current = current.next
        end      
        current.next = @tail
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  
    # Space Complexity
    def get_last
      if !@head
        return nil
      end
      return @tail.data
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  
    # Space Complexity
    def get_at_index(index)
      current = @head

      if current
        index.times do 
          current = current.next
        end
        return current.data
      else
        return nil
      end
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_max
      if @head
        current = @head
        max = 0
        while current
          current.data > max ? max = current.data : current = current.next
        end
        return max
      else
        return nil
      end
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_min
      if @head
        current = @head
        min = @head.data
        while current
          current.data < min ? min = current.data : current = current.next
        end
        return min
      else
        return nil
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity:  
    # Space Complexity
    # CHRIS - this isn't working! I'm pretty sure this is because it's not updating tail, bu
    def delete(value) 
      if @head == nil
        return
      end
      current = @head

      if value == current.data
        @head = current.next
        return
      end

      while current.next
        if current.next.data == value
          if current.next == @tail
            @tail = current
            current.next = nil
            return
          else
            current.next = current.next.next
            return
          end
        end
        current = current.next
      end
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

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      return if !@head

      current = @head
      while current
        puts "#{current.data}"
        current = current.next
      end

    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  
    # Space Complexity
    def reverse
      return if !@head || !@head.next
      
      count = self.length
      current = @head
      index = count - 1

      count.times do
        temp = self.get_at_index(index)
        self.delete(temp)
        self.add_first(temp)
      end
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
      return if !@head
      return @head.data if n == 0
      return @tail.data if n == 1

      binding.pry
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity:  
    # Space Complexity
    def has_cycle
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
