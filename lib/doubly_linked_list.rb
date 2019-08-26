require_relative "linked_list"
require "pry"

class DoublyLinkedNode < Node 
    attr_accessor :prev
    def initialize(value, prev_node = nil, next_node = nil)
      super(value, next_node)
      @prev = prev_node
    end
end


class DoublyLinkedList < LinkedList
    def initialize
        super
        @tail = nil
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1), since insertion at the head doesn't require traversal of the linked list
    # Space Complexity O(1), space required will always be the size of 1 node
    def add_first(value)
      new_node = DoublyLinkedNode.new(value, nil, @head)
      @head.prev = new_node if @head
      @head = new_node
      @tail = new_node if !new_node.next
    end

# method that inserts a given value as a new last node in the linked list
    # Time Complexity:  O(1), no traversal required to find tail
    # Space Complexity O(1),  space required will always be the size of 2 nodes (cursor, and new_node)
    def add_last(value)
        new_node = DoublyLinkedNode.new(value, @tail, nil)
        if @tail
            @tail.next = new_node
            new_node.prev = @tail
            @tail = new_node
        else
            @head = new_node
            @tail = new_node
        end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(1), no list traversal required
    # Space Complexity O(1),  no new variables created
    def get_last
        return @tail ? @tail.data : nil
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity:  O(n) where n is the length of the linked list
    # Space Complexity O(1),  space required will always be the size of 2 nodes (cursor, and new_node)
    def insert_ascending(value)
        new_node = DoublyLinkedNode.new(value)
        cursor = @head
        until !cursor.next || cursor.next.data >= value
          cursor = cursor.next
        end
        new_node.next = cursor.next
        new_node.next.prev = new_node if new_node.next
        new_node.prev = cursor
        cursor.next = new_node
      end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity:  O(n) where n is the length of the linked list
    # Space Complexity O(1),  space required will always be the size of 1 node (cursor), and 2 int (index, list_length)
    def find_nth_from_end(n)
        list_length = self.length
        return nil if n > list_length - 1 || n < 0
        cursor = @tail
        n.times do
            cursor = cursor.prev
        end
        return cursor.data
    end

    # method to delete the first node found with specified value
    # Time Complexity:  O(n) where n is the length of the linked list
    # Space Complexity O(1),  space required will always be the size of 1 node (cursor)
    def delete(value)
        return nil if !@head
        if @head.data == value
          @head = @head.next
          @head.prev = nil
          return
        end 
        cursor = @head
        while cursor && cursor.data != value
          cursor = cursor.next
        end

        if cursor
            cursor.prev.next = cursor.next
            cursor.next.prev = cursor.prev if cursor.next
            @tail = cursor.prev if cursor == @tail
            
        end
    end
  


    # method to reverse the doubly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n) , n for traversing length of list
    # Space Complexity: O(n), n for length of new list
    def reverse
        cursor = @tail
        @head = cursor
        until !cursor.prev do

            temp = cursor.next
            cursor.next = cursor.prev
            cursor.prev = temp
            cursor = cursor.next
            
        end
        cursor.prev = cursor.next
        cursor.next = nil

        @tail = cursor    
        
    end

end