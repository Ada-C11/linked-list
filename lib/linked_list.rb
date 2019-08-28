
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
    # Time Complexity: O(1) (constant), because the length of the list doesn't matter
    # Space Complexity: O(n), where n is the length of the list
    def add_first(value)
      new_node = Node.new(value, nil)
      new_node.next = @head
      @head = new_node

      return new_node.data
    end

    # Additional Exercises
        # returns the value in the first node
        # returns nil if the list is empty
        # Time Complexity: O(1)
        # Space Complexity: O(1)
        def get_first
          return nil if @head.nil?

          return @head.data
        end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      node = @head
          return false if !node.next
          return node if node.value == value
          while (node = node.next)
            return node if node.value == value
          end
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), where n is the length of the list
    # Space Complexity: O(1)
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
    # Time Complexity: O(n), where n is the length of the list
    # Space Complexity: O(1)
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
    # Time Complexity: O(n), where n is the length of the list
    # Space Complexity: O(1)
    def length
      current = @head

      return 0 if current.nil?
      length = 0

      until current.nil?
        current = current.next
        length += 1
      end

      return length
    end

    # method that inserts a given value as a new last node in the linked list
        # Time Complexity: O(n), where n is the length of the list
        # Space Complexity: unsure. O(1) because we're not creating a new data structure, we're just adding to
        # an existing one?
        def add_last(value)
            new_node = Node.new(value)
          if @head
               current = @head
                until current.next.nil?
                  current = current.next
                end
              current.next = new_node
          else
              @head = new_node
          end
        end

        # method that returns the value of the last node in the linked list
        # returns nil if the linked list is empty
        # Time Complexity: O(n), where n is the length of the list
        # Space Complexity: O(1)
        def get_last
          node = @head

          return nil if node.nil?

          return node.data if !node.next
          return node.data if !node.next while (node = node.next)

        end
    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?

      # I feel like I could do something like use the length method from before and compare the result to the index

           count = 0
           current = @head
           while count != index && !current.next.nil?
             current = current.next
             count += 1
           end
           current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit

        visit_array = []
      if self.length == 0
              puts "empty"
          else
            node = @head
              until node.nil?
                visit_array << node.data
                node = node.next
              end
       end

       return visit_array
    end



    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      return @head if @head.nil? || @head.next.nil?
      current_node = @head
      previous_node = nil


      while current_node
        temp = current_node.next
        current_node.next = previous_node
        previous_node = current_node
        current_node = temp
      end
      @head = previous_node

    end

 # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
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


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity:
    # Space Complexity
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
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

