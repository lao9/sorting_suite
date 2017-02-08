require "pry"

class MergeSort
  def initialize
  end

  def sort(collection)
    new_col = separate(collection)
    until new_col.count == 1
      new_col = create_new_collection(new_col)
    end
    return new_col[0]
  end

  def create_new_collection(new_col)
    output = []
    new_len = new_col.length/2
    new_len.times {output << merge(new_col.shift, new_col.shift)}
    output << new_col.shift if new_col.length.odd?
    return output
  end

  def separate(item)
    output = []
    new_len = item.length/2
    new_len.times { output << mini_swap(item.shift, item.shift)}
    output << [item.shift] if item.length.odd?
    return output
  end

  def mini_swap(item1, item2)
    output = []
    item2 < item1 ? output.push(item2, item1) : output.push(item1, item2)
    return output
  end

  def merge(array1, array2)
    output = []
    until array1[0] == nil || array2[0] == nil
      array1[0] < array2[0] ? output.push(array1.shift) : output.push(array2.shift)
    end
    array1[0] == nil ? array2.each {|x| output.push(x)} : array1.each {|x| output.push(x)}
    return output
  end

end
