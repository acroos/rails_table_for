require 'byebug'
require 'action_view'
require 'minitest/autorun'
require_relative '../lib/rails_table_for/table_helper'

class TestTableHelper < Minitest::Test
  include TableHelper
  def setup
    @records = [0..10].map do 
      record = Minitest::Mock.new
      # TODO: expect some calls
      record
    end
  end

  def test_es
    output = table_for(@records)
    assert_equal 'table', output
  end
end