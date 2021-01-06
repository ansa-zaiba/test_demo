# Include libs: Rspec
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
        s = ""
        while !(node.nil?)
            s << "#{node.value} "
            node = node.np
        end
        puts s
    end
    def self.break_list(head)
        p1 = head
        p2 = head
        if head.np.np.nil?
            front = head
            back = head.np
            front.np = nil
            return front, back
        end
        while !p2.nil? and !p2.np.nil?
            p1 = p1.np
            p2 = p2.np.np
        end
        next_to_mid = p1.np
        front = head
        p1.np = nil
        back = next_to_mid
        return front , back  
    end
    def self.merge_sort(head)
        if head.nil? or head.np.nil?
           return head 
        end
        first_half,second_half = Linkedlist.break_list(head)

        Linkedlist.print_list(first_half)
        puts "1end"
        Linkedlist.print_list(second_half)
        puts "2end"
        sorted = Linkedlist.merge(Linkedlist.merge_sort(first_half),Linkedlist.merge_sort(second_half))
        

        return sorted
    end
    def self.get_tail(list)
        current = list
        while !list.np.nil?
            current = current.np
        end

        return current
    end
    def self.merge(l1,l2)
        return nil if l1.nil? and l2.nil?
        return l1 if l2.nil?
        return l2 if l1.nil?    
        
        #single element
        if l1.np.nil? and l2.np.nil?
            if l1.value < l2.value
                l1.np = l2
                merged = l1
            else
                l2.np = l1
                merged = l2
            end
            return merged
        end
        
        #many elements
        merged = nil
        merged_tail = nil
        while !(l1.nil? and l2.nil?)

            if l2.nil?
                merged, merged_tail = Linkedlist.insert_into_list(merged, merged_tail ,l1)
            elsif l1.nil?
                merged, merged_tail = Linkedlist.insert_into_list(merged, merged_tail ,l2)
            else
                if l1.value < l2.value
                    temp = l1.np
                    merged merged_tail = Linkedlist.insert_into_list(merged,merged_tail,l1)
                    l1 = temp
                else
                    temp = l2.np
                    merged merged_tail = Linkedlist.insert_into_list(merged,merged_tail,l2)
                    l2 = temp
                end
            end
        end
        return merged
    end

    def self.insert_into_list(merged, merged_tail , list)
        if merged.nil?
            merged = list
            merged_tail = Linkedlist.get_tail(list)
            return merged, merged_tail
        end
        temp = Linkedlist.get_tail(list)
        merged_tail.np = list
        merged_tail = temp
        return merged, merged_tail
    end
    
    
end

# Linkedlist.print_list(Linkedlist.create_list)
Linkedlist.print_list(Linkedlist.merge_sort((Linkedlist.create_list)))
