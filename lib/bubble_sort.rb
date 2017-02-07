require "pry"

class BubbleSort
  def sort(collection)

    position = 0
    ready_to_quit = false
    swap_arr = []

    until ready_to_quit == true

      while position < collection.length-1

      poi_1 = collection[position+1]
      poi_2 = collection[position]

        if (poi_1 < poi_2) == true
          collection[position] = poi_1
          collection[position+1] = poi_2
          swap_arr[position] = true
        else
          swap_arr[position] = false
        end
        position += 1

      end

      if swap_arr.include?(true) == true
        position = 0
      else
        ready_to_quit = true
      end

    end
    return collection
  end

end
