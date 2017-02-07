require "pry"

class MergeSort
  def initialize
  end

  def sort(collection)
    # insert array of numbers into sort method

    # break array into half and half
    # insert into "separate"
    # output of separate should be ([38, 27], [43, 3], [9, 82], [10])

    # then we merge items for each element of the array
    # and return ([27, 38], [3, 43], [9, 82], [10])

    # then we merge our first two elements
    # and return [3, 27, 38, 43], [9, 10, 82]

    # then finally [3, 9, 10, 27, 38, 43, 82]

  end

  def separate(item)
    output = []
    new_len = item.length/2
    new_len.times { output << [item.shift, item.shift]}
    output << [item.shift] if item.length.odd?
    return output
  end

  def merge(collection)
    output = []
    collection.length.times do

    end
  end

end
