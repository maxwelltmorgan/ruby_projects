# Build a method #bubble_sort that takes an array and returns a sorted array

def bubble_sort arr
    loop do
    complete = false
        (arr.length-1).times do |index|
            if arr[index] > arr[index + 1]
                arr[index], arr[index + 1] = arr[index + 1], arr[index]
                complete = true
            end
        end
        break if complete == false
    end
    puts arr
end

bubble_sort([4,3,78,2,0,2])
#[0,2,2,3,4,78]

def bubblesort_by arr
    loop do
    complete = false
        (arr.length-1).times do |index|
            if yield(arr[index], arr[index+1]) > 0
                arr[index], arr[index+1] = arr[index+1], arr[index]
                complete = true
            end
        end
        break if !complete
    end
    puts arr
end

bubblesort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }
