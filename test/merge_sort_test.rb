require "minitest"
require 'minitest/autorun'
require 'minitest/pride'
require '../sorting_suite/lib/merge_sort'
require 'pry'

class MergeSortTest < Minitest::Test
  attr_accessor :sorter
  def setup
    @sorter = MergeSort.new
  end

  def test_mini_swap
    assert_equal [27, 38], sorter.mini_swap(38, 27)
    assert_equal [27, 38], sorter.mini_swap(27, 38)
  end

  def test_separate_with_even_array
    assert_equal [[27, 38], [3, 43]], sorter.separate([38, 27, 43, 3])
    assert_equal [[27, 38], [3, 43], [9, 82]], sorter.separate([38, 27, 43, 3, 9, 82])
  end

  def test_separate_with_odd
    assert_equal [[27, 38], [3, 43], [9, 82], [10]], sorter.separate([38, 27, 43, 3, 9, 82, 10])
  end

  def test_small_merge_even_array
    assert_equal [3, 27, 38, 43], sorter.merge([27, 38], [3, 43])
    assert_equal [3, 27, 38, 43], sorter.merge([3, 27], [38, 43])
    assert_equal [3, 27, 38, 43], sorter.merge([38, 43], [3, 27])
  end

  def test_small_merge_odd_array
    assert_equal [9, 10, 82], sorter.merge([9, 82], [10])
    assert_equal [3, 9, 10, 27, 38, 43, 82], sorter.merge([3, 27, 38, 43], [9, 10, 82])
  end

  def test_merge_iteration_with_even_arrays
    sep_col = [[27, 38], [3, 43], [9, 82], [10]]
    sep_col2 = [[3, 27, 38, 43], [9, 10, 82]]
    sep_col3 = [[3, 9, 10, 27, 38, 43, 82]]
    assert_equal sep_col2, sorter.create_new_collection(sep_col)
    assert_equal sep_col3, sorter.create_new_collection(sep_col2)
  end

  def test_merge_iteration_with_odd_arrays
    sep_col = [[27, 38], [3, 43], [9, 82], [10, 14], [13, 75]]
    sep_col2 = [[3, 27, 38, 43], [9, 10, 14, 82], [13, 75]]
    sep_col3 = [[3, 9, 10, 14, 27, 38, 43, 82], [13, 75]]
    sep_col4 = [[3, 9, 10, 13, 14, 27, 38, 43, 75, 82]]
    assert_equal sep_col2, sorter.create_new_collection(sep_col)
    assert_equal sep_col3, sorter.create_new_collection(sep_col2)
    assert_equal sep_col4, sorter.create_new_collection(sep_col3)
  end

  def test_merge_iteration_with_ever_odder_arrays
    sep_col = [[27, 38], [3, 43], [9, 82], [10, 14], [13, 75], [4]]
    sep_col2 = [[3, 27, 38, 43], [9, 10, 14, 82], [4, 13, 75]]
    sep_col3 = [[3, 9, 10, 14, 27, 38, 43, 82], [4, 13, 75]]
    sep_col4 = [[3, 4, 9, 10, 13, 14, 27, 38, 43, 75, 82]]
    assert_equal sep_col2, sorter.create_new_collection(sep_col)
    assert_equal sep_col3, sorter.create_new_collection(sep_col2)
    assert_equal sep_col4, sorter.create_new_collection(sep_col3)
  end

  def test_sorter
    assert_equal [3, 9, 10, 27, 38, 43, 82], sorter.sort([38, 27, 43, 3, 9, 82, 10])
    assert_equal [3, 9, 10, 13, 14, 27, 38, 43, 75, 82], sorter.sort([38, 27, 43, 3, 9, 82, 10, 14, 75, 13])
    assert_equal [3, 4, 9, 10, 13, 14, 27, 38, 43, 75, 82], sorter.sort([38, 27, 43, 3, 9, 82, 10, 14, 75, 13, 4])
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
