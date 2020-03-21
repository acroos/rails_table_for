require 'byebug'
require 'action_view'
require 'minitest/autorun'
require 'rails_table_for/table_helper'

class TestTableHelper < Minitest::Test
  include TableHelper, ActionView::Context

  def test_empty_table
    @records = []
    html = table_for @records
    test_html_output(html)
  end

  def test_simplest_table
    @records = Array.new(1) do 
      record = Minitest::Mock.new
      2.times { record.expect :primary_key, 'id' }
      record.expect :id, '1'
    end
    html = table_for @records
    test_html_output(html)
  end

  private
  def test_html_output(actual_html)
    test_name = caller_locations[0].label
    actual_html = remove_all_whitespace(actual_html)
    expected_html = fetch_test_html(test_name)
    assert_equal expected_html, actual_html
  end

  def fetch_test_html(test_name)
    path = File.join(__dir__, 'data', "#{test_name}.html")
    formatted_html = File.read(path)
    remove_all_whitespace(formatted_html)
  end

  def remove_all_whitespace(text)
    text.gsub(/\s/, '')
  end
end