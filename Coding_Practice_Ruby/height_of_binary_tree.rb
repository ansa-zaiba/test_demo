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
    def self.height(root)
        
        if root.nil?
            return 0
        elsif root.left.nil? and root.right.nil?
            return 1
        else
            
            return [BinaryTree.height(root.left),BinaryTree.height(root.right)].max + 1
        end
    end
end
root = BinaryTree.build_tree
puts "#{BinaryTree.height(root)}"