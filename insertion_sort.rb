require 'pry'

class InsertionSort

  def sort(collection)

    sorted = [collection.shift]

    counter = 0

    until collection[0] == nil

      if collection[0] < sorted[counter]
        sorted.insert(counter, collection.shift)
        counter = 0
      else
        counter += 1
      end

      if counter >= sorted.count
        sorted.insert(counter, collection.shift)
        counter = 0
      end

    end

    puts sorted

  end

end

sorter = InsertionSort.new
# <InsertionSort:0x007f81a19e94e8>
sorter.sort(["d", "b", "a", "c"])
# ["a", "b", "c", "d"]
sorter.sort([*1..100].shuffle)

# binding.pry
# ""
