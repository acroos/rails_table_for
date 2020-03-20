require 'byebug'
require 'action_view'
require 'minitest/autorun'
require_relative '../lib/rails_table_for/table_helper'

class TestTableHelper < Minitest::Test
  include TableHelper, ActionView::Context, ActionView::Helpers::TagHelper

  def test_empty_table
    @records = Minitest::Mock.new
    html = table_for(@records)
    assert_equal '<table></table>', html
  end
end