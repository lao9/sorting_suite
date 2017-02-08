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

    sorted

  end


end
