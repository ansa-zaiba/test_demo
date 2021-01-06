class Double
	def self.find_double(arr,b)
		arr.each do |x|
			if x == b
				 b = 2*b
			end
		end
		return b
	end
end

puts Double.find_double([1, 2,3, 4, 8], 3)
