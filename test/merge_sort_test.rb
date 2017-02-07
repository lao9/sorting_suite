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

  def test_separate_with_even_array
    assert_equal [[38, 27], [43, 3]], sorter.separate([38, 27, 43, 3])
    assert_equal [[38, 27], [43, 3], [9, 82]], sorter.separate([38, 27, 43, 3, 9, 82])
  end

  def test_separate_with_odd
    assert_equal [[38, 27], [43, 3], [9, 82], [10]], sorter.separate([38, 27, 43, 3, 9, 82, 10])
  end

  def test_small_merge_even_array
    assert_equal [27, 38], sorter.merge([38, 27])
  end

end
