# Include libs: Rspec

puts 'Hello, world!'

class Node
    def initialize(value = nil ,left = nil ,right = nil )
        @value = value
        @left = left
        @right = right
    end
    def value
        @value
    end
    def left
        @left
    end
    def right
        @right
    end
    def value=(value)
        @value = value
    end
    def left=(left)
        @left = left
    end
    def right=(right)
        @right = right
    end
end

class BinaryTree
    def self.build_tree
        root = Node.new(1,nil,nil)
        root.left = Node.new(2, nil, nil)
        root.right = Node.new(3,nil,nil)
        root.left.left = Node.new(4,nil,nil)
        root.left.right = Node.new(5, nil, nil)
        return root
    end
    def self.level_order_print(root)
        queue = Queue.new
        queue.push(root)
        while !(queue.empty?)
            node = queue.pop
            puts "#{node.value}"
            queue << node.left if !node.left.nil?
            queue << node.right if !node.right.nil?
        end
    end
    def self.spiral_print(root)
        direction = 0
        queue = Queue.new
        queue << root
        while !queue.empty? do
            size = queue.size
            while size != 0 do
                temp = queue.pop
                puts temp.value
                case direction
                    when 0
                    queue << temp.left unless temp.left.nil?
                    queue << temp.right unless temp.right.nil?
                    when 1
                    queue << temp.right unless temp.right.nil?
                    queue << temp.left unless temp.left.nil?
                end
                size = size - 1
            end
            direction = direction == 0 ? 1 : 0
    end
end
root = BinaryTree.build_tree
BinaryTree.level_order_print(root)
BinaryTree.spiral_print(root)
