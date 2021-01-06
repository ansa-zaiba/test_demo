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

    def self.build_tree
        root = Node.new('+',nil,nil)
        root.left = Node.new('*', nil, nil)
        root.right = Node.new('-',nil,nil)
        root.left.left = Node.new(5,nil,nil)
        root.left.right = Node.new(4, nil, nil)
        root.right.left = Node.new(100,nil,nil)
        root.right.right = Node.new(20, nil, nil)
        return root
    end
end

class Evaluate
	def self.evaluate(root)
		if root.left.nil? and root.right.nil?
			return root.value
		end 

		left = Evaluate.evaluate(root.left)
		right = Evaluate.evaluate(root.right)
		return Evaluate.calculate(root.value, left, right)
	end

	def self.calculate(sym, left, right)
		case sym
		when '+'
			return left.to_i + right.to_i
		when '-'
			return left.to_i - right.to_i
		when '*'
			return left.to_i * right.to_i
		when '/'			
			return left.to_i / right.to_i
		end
	end
end

puts Evaluate.evaluate(Node.build_tree)