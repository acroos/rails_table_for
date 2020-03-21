require 'byebug'
require 'action_view'
require 'minitest/autorun'
require 'rails_table_for/table_helper'

class TestTableHelper < Minitest::Test
  include TableHelper, ActionView::Context

  def test_no_table
    records = []
    html = table_for(records, columns: [:id])
    assert_equal '', html
  end

  def test_simplest_table
    records = mock_records([:id], count: 1)
    html = table_for(records, columns: [:id])
    check_html_output(html)
  end

  def test_two_columns_table
    columns = [:col0, :col1]
    records = mock_records(columns, count: 1)
    html = table_for(records, columns: columns)
    check_html_output(html)
  end

  private
  def check_html_output(actual_html)
    test_name = caller_locations[0].label
    actual_html = minify_html(actual_html)
    expected_html = fetch_test_html(test_name)
    assert_equal expected_html, actual_html
  end

  def fetch_test_html(test_name)
    path = File.join(__dir__, 'data', "#{test_name}.html")
    formatted_html = File.read(path)
    minify_html(formatted_html)
  end

  def minify_html(text)
    text.gsub(/>\s*</, '><')
  end

  def mock_records(columns, count:)
    count.times.map do |index|
      record = Minitest::Mock.new
      columns.each do |column|
        record.expect column, "row#{index}"
      end
      record
    end
  end
end