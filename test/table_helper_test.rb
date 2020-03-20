require 'byebug'
require 'action_view'
require 'minitest/autorun'
require_relative '../lib/rails_table_for/table_helper'

class TestTableHelper < Minitest::Test
  include TableHelper, ActionView::Context

  def test_empty_table
    @records = []
    html = table_for(@records)
    assert_equal '<table></table>', html
  end

  def test_simplest_table
    @records = Array.new(1) do 
      record = Minitest::Mock.new
      2.times { record.expect :primary_key, 'id' }
      record.expect :id, '1'
    end
    html = table_for(@records)
    assert_equal '<table><thead><tr><th>id</th></tr></thead><tbody><tr><td>1</td></tr></tbody></table>', html
  end
end