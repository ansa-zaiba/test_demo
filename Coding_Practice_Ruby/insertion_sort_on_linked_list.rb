# Include libs: Rspec

puts 'Hello, world!'
class Node
    def initialize(value = nil , np = nil)
        @value = value
        @np = np
    end
    def value
        @value
    end
    def np
        @np
    end
    def value=(value)
        @value = value
    end
    def np=(np)
        @np = np
    end
end

class Linkedlist
    def self.create_list
        head = Node.new(5,nil)
        head.np = Node.new(3,nil)
        head.np.np = Node.new(7,nil)
        head.np.np.np = Node.new(1,nil)
        return head
    end
    def self.print_list(head)
        node = head
        while !(node.nil?)
            puts "#{node.value}"
            node = node.np
        end
    end
    def self.sort_list(head)
        current = head
        sorted_list_head = nil
        while current != nil
            temp = current.np
            sorted_list_head = Linkedlist.insert_into_sorted_list(sorted_list_head,current)
            current = temp
        end

        return sorted_list_head
    end
    def self.insert_into_sorted_list(sorted_list_head, xnode)
        return sorted_list_head if xnode.nil?
        if sorted_list_head.nil? || xnode.value < sorted_list_head.value
            xnode.np = sorted_list_head
            sorted_list_head = xnode
        else
            current = sorted_list_head
            while !current.np.nil? and current.np.value > xnode.value

                current = current.np
            end
            xnode.np = current.np
            current.np = xnode
        end
        
        return sorted_list_head
    end
end

# Linkedlist.print_list(Linkedlist.create_list)
Linkedlist.print_list(Linkedlist.sort_list((Linkedlist.create_list)))
