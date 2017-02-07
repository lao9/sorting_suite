require "minitest"
require 'minitest/autorun'
require 'minitest/pride'
require '../sorting_suite/lib/insertion_sort'
require 'pry'

class InsertionSortTest < Minitest::Test
  attr_accessor :sorter
  def setup
    @sorter = InsertionSort.new
  end

  def test_small_alphabet_arrays
    assert_equal ["a", "b", "c", "d"], sorter.sort(["d", "b", "a", "c"])
  end

  def test_small_number_arrays
    assert_equal [0, 1, 2, 3, 4], sorter.sort([1, 2, 0, 4, 3])
    assert_equal [-4, -3, -2, -1, 0], sorter.sort([-2, -1, -3, -4, 0])
    assert_equal [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5], sorter.sort([4, 3, 0, -2, -1, 5, -3, -4, 2, 1, -5])
  end

  def test_large_arrays
    assert_equal [*1..100], sorter.sort([*1..100].shuffle)
    assert_equal [*1..1000], sorter.sort([*1..1000].shuffle)
    assert_equal [*1..10000], sorter.sort([*1..10000].shuffle)
  end

end
