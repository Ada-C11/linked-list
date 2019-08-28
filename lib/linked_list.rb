
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
      node = Node.new(value, @head)
      # node.next = @head
      @head = node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity:  
    # Space Complexity
    def search(value)
      node = @head
      
      until node == nil
        if node == value
          return true
        else
          node = node.next
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_max
      max = nil
      node = @head 

      until node == nil
        if node.data > max
          max = node.data
        else
          node = node.next
        end
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity:  
    # Space Complexity
    def find_min
      min = nil
      node = @head 

      until node == nil
        if node.data < min
          min = node.data
        else
          node = node.next
        end
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity:  
    # Space Complexity
    def length
      length = 0
      node = @head

      until node == nil
        length += 1
        node = node.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity:  
    # Space Complexity
    def get_at_index(index)
      value = nil
      node = @head
      i = 0

      # return nil if node == nil

      until node == nil
        if i == index
          value = node.data
          break
        end
        node = node.next
        i += 1
      end

      return value
    end

    # method to print all the values in the linked list
    # Time Complexity:  
    # Space Complexity
    def visit
      node = @head

      return nil if node == nil

      until node == nil
        puts node.data
        node = node.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity:  
    # Space Complexity
    def delete(value)
      node = @head
      delete = false

      until node == nil || delete == true
        if node.data == value
          @head = node.next
          delete = true
        elsif node.next.data == value
          node.next = node.next.next
          delete = true
        end
        node = node.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity:  
    # Space Complexity
    def reverse
      # node = @head

      # until node == nil
        
      # end


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
      node = @head 

      return node == nil ? nil : node.value
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity:  
    # Space Complexity
    def add_last(value)
      node = @head 

      until node == nil
        node = node.next
      end

      node = Node.new(value)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity:  
    # Space Complexity
    def get_last
      node = @head

      return nil if node == nil

      until node.next == nil
        node = node.next
      end

      return node.data
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


# class intersection
#   list1 = LinkedList.new().head().add_first(5).add_first.(3). add_first(1)
#   list2 = LinkedList.new().head().add_first(4).add_first.(2)

#   if list1.
# end