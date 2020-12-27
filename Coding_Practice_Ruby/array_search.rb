# Include libs: Rspec

puts 'Hello, world!'


class ArraySearch
    @@position = nil
    def self.binary_search(array,l,h,key)
        if l<=h
            mid = (l+h)/2
            if key == array[mid]
                return mid
            elsif key < array[mid]
                return ArraySearch.binary_search(array,l,mid-1,key)
            elsif key > array[mid]
                return ArraySearch.binary_search(array, mid+1, h,key)
            end
        else
            return -1
        end
    end
end

puts "#{ArraySearch.binary_search([1,2,3,4,5],0,4,1)}"