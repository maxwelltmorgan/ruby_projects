module Enumerable

    def my_each
    counter = 0
        while counter < self.size
            yield(self[counter])
            counter += 1
        end
        self
    end

    def my_each_with_index
    counter = 0
        while counter < self.size
            yield(self[counter], counter)
            counter += 1
        end
        self
    end

    def my_select
        result = []
        self.my_each do |item|
            if yield(item) == true
                result << item
            end
        end
        result
    end

    def my_all?
        self.my_each do |item|
            return false if yield(item) == false
        end
        true
    end

    def my_any?
        self.my_each do |item|
            return true if yield(item) == true
        end
        false
    end

    def my_none?
        self.my_each do |item|
            return false if yield(item) == true
        end
        true
    end

    def my_count(param='defaultparam')
		count = 0
		self.my_each do |item|
			if block_given?
				count += 1 if yield(item) == true
			else
				if param != 'defaultparam'
					count += 1 if param == item
				else
					count += 1
				end
			end
		end
		count
	end


    def my_map(a_proc=true)
		result = []
		self.my_each do |item|
			if a_proc.is_a?(Proc)
				result << a_proc.call(item)
			else
				result << yield(item)
			end
		end
		result
	end

    def my_inject(param=self.first)
		total = param
		self.my_each do |item|
			total = yield(total, item)
		end
		total
	end

    def multiply_els
		self.my_inject(1){|total, item| total * item}
	end
end
