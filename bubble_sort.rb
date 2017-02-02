require "pry"

class BubbleSort
  def sort(collection)

    position = 0
    ready_to_quit = false
    swap_arr = []

    until ready_to_quit == true

      while position < collection.length-1

      position_of_interest_1 = collection[position+1]
      position_of_interest_2 = collection[position]

      #binding.pry

        if (position_of_interest_1 < position_of_interest_2) == true
          collection[position] = position_of_interest_1
          collection[position+1] = position_of_interest_2
          swap_arr[position] = true
        else
          swap_arr[position] = false
        end
        position += 1

      end

      #binding.pry

      if swap_arr.include?(true) == true
        #ready_to_quit will still be true
        position = 0
      else
        ready_to_quit = true
        puts collection
      end

    end
  end

end

sorter = BubbleSort.new

binding.pry

sorter.sort(["d", "b", "a", "c"])


# => ["a", "b", "c", "d"]
