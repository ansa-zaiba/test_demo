# Include libs: Rspec

puts 'Hello, world!'


class QueueWithStack
    def initialize
        @s1 = []
        @s2 = []
    end
    def s1
        @s1
    end
    def s2
        @s2
    end
    def enqueue(value)
        while !self.s1.empty?
            self.s2 << self.s1.pop
        end
        self.s2 << value
        while !self.s2.empty?
            self.s1 << self.s2.pop
        end
    end
    def dequeue
        return self.s1.pop
    end
    
    def self.test
        q = QueueWithStack.new
        q.enqueue(1)
        q.enqueue(2)
        q.enqueue(3)
        q.enqueue(4)
        q.enqueue(5)
        
        puts q.dequeue
        puts q.dequeue
        
    end
end

QueueWithStack.test
