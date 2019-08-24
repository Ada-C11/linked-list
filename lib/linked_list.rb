require "pry"

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
      cursor = @head
      while cursor
        return true if cursor.data == value
        cursor = cursor.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_max
      return nil if !@head
      cursor = @head
      max = cursor.data
      while cursor
        if cursor.data > max
          max = cursor.data
        end
        cursor = cursor.next
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_min
      return nil if !@head
      cursor = @head
      min = cursor.data
      while cursor
        if cursor.data < min
          min = cursor.data
        end
        cursor = cursor.next
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  
    # Space Complexity
    def length
      length = 0
      if !@head
        return length
      else
        current = @head
        while current
          length += 1
          current = current.next
        end
      end
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  
    # Space Complexity
    def get_at_index(index)
      return nil unless @head
      current = @head
      index.times do
        return nil unless current.next
        current = current.next
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      cursor = @head
      while cursor
        puts cursor.data
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity:  
    # Space Complexity
    def delete(value)
      return nil if !@head
      if @head.data == value
        @head = @head.next 
        return nil
      end 
      cursor = @head
      while cursor.next && cursor.next.data != value
        cursor = cursor.next
      end
        cursor.next = cursor.next.next if cursor.next
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  
    # Space Complexity
    def reverse
      return nil if !@head
      @head = build_reversed
    end

    def build_reversed(new_head=nil)
      cursor = @head
      until !cursor.next
        prev = cursor
        cursor = cursor.next
      end

      if !new_head
        new_head = cursor
        tail = new_head
      else
        tail = new_head
        tail = tail.next until !tail.next
      end
      tail.next = prev
      prev ? prev.next = nil : @head = nil

      

      if @head 
        return build_reversed(new_head)
      else
        return new_head
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
      list_length = self.length
      return nil if n > list_length - 1
      index = 1
      cursor = @head
      until (list_length - index) == n || !cursor.next
        index +=1
        cursor = cursor.next
      end
      return cursor.data
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
      return @head ? @head.data : nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  
    # Space Complexity
    def add_last(value)
      new_node = Node.new(value)
      if !@head
        @head = new_node
      else
        current = @head
        while current.next
          current = current.next
        end
        current.next = new_node
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  
    # Space Complexity
    def get_last
      return nil unless @head
      current = @head
      while current.next
        current = current.next
      end
    return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity:  
    # Space Complexity
    def insert_ascending(value)
      new_node = Node.new(value)
      current = @head
      until !current.next || current.next.data >= value
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
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
