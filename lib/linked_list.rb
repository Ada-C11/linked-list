
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
      new_node = Node.new(value)

      new_node.next = @head if @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity:  
    # Space Complexity
    def search(value)
      return false if !@head

      current = @head
     
      until !current
        current.data == value ? (return true) : current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_max
      return if !@head

      current = @head
      max = nil
        
      until !current
        !max || current.data > max ? max = current.data : current = current.next
      end
    
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_min
      return if !@head

      current = @head
      min = nil

      until !current
        !min || current.data < min ? min = current.data : current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  
    # Space Complexity
    def length
      current = @head
      node_count = 0 

      while current
        current = current.next
        node_count += 1
      end

      return node_count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  
    # Space Complexity
    def get_at_index(index)
      return if index + 1 > self.length

      current = @head
      index.times { current = current.next }

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      return if !@head

      current = @head
      list_string = ""

      until !current
        list_string << "#{current.data} "
        current = current.next
      end

      print list_string
      return list_string
    end

    # method to delete the first node found with specified value
    # Time Complexity:  
    # Space Complexity
    def delete(value)
      return if !@head

      previous = nil
      current = @head

      until !current
        if current.data == value 
          @head.data == value ? @head = current.next : previous.next = current.next
        end

        previous = current
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  
    # Space Complexity
    def reverse
      return if !@head || !@head.next

      previous = nil
      current = @head

      while current
        subsequent = current.next
        current.next = previous
        previous = current
        current = subsequent
      end

      @head = previous
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity:  
    # Space Complexity
    def find_middle_value
      return if !@head

      current = @head
      (self.length / 2).times { current = current.next }

      return current.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity:  
    # Space Complexity
    def find_nth_from_end(n)
      return if self.length <= n
        
      current = @head
      (length - n - 1).times { current = current.next} 
    
      return current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity:  
    # Space Complexity
    def has_cycle
      return false if !@head

      visited_nodes = []
      current = @head

      until !current
        return true if visited_nodes.include?(current)

        visited_nodes << current
        current = current.next
      end

      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity:  
    # Space Complexity
    def get_first
      return !@head ? nil : @head.data
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

        until !current.next
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
      return if !@head
      
      current = @head
        
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
      return self.add_first(value) if !@head 

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

