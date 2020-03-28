# require 'byebug'
# require 'action_view'
# require 'minitest/autorun'
# require 'rails_table_for/table_helper'

# class TestTableHelper < Minitest::Test
#   include TableHelper, ActionView::Context

#   def test_no_table
#     records = []
#     html = table_for(records, columns: [:id])
#     assert_equal '', html
#   end

#   def test_simplest_table
#     records = mock_records([:id], rows: 1)
#     html = table_for(records, columns: [:id])
#     check_html_output(html)
#   end

#   def test_two_columns_table
#     columns = [:col0, :col1]
#     records = mock_records(columns, rows: 1)
#     html = table_for(records, columns: columns)
#     check_html_output(html)
#   end

#   def test_two_rows_table
#     columns = [:col0]
#     records = mock_records(columns, rows: 2)
#     html = table_for(records, columns: columns)
#     check_html_output(html)
#   end

#   def test_table_with_block
#     records = mock_records([:col0], rows: 1)
#     html = table_for(records) do |table|
#       table.column :col0
#     end
#     check_html_output(html)
#   end

#   def test_table_with_custom_column_title
#     records = mock_records([:col0], rows:1)
#     html = table_for(records) do |table|
#       table.column :col0, title: 'CUSTOM TITLE'
#     end
#     check_html_output(html)
#   end

#   def test_table_with_custom_column_value
#     records = mock_records([:col0], rows:1)
#     html = table_for(records) do |table|
#       table.column title: 'title' do |record|
#         "RECORD: #{record.col0}"
#       end
#     end
#     check_html_output(html)
#   end

#   private
#   def check_html_output(actual_html)
#     test_name = caller_locations[0].label
#     actual_html = minify_html(actual_html)
#     expected_html = fetch_test_html(test_name)
#     assert_equal expected_html, actual_html
#   end

#   def fetch_test_html(test_name)
#     path = File.join(__dir__, 'data', "#{test_name}.html")
#     formatted_html = File.read(path)
#     minify_html(formatted_html)
#   end

#   def minify_html(text)
#     text.gsub(/>\s*</, '><')
#   end

#   def mock_records(columns, rows:)
#     model = Minitest::Mock.new
#     model_name = Minitest::Mock.new
#     model_name.expect :name, 'Record'
#     model_name.expect :singular_route_key, 'hi'
#     model.expect :model_name, model_name
#     model.expect :model_name, model_name
#     model.expect :persisted?, true
#     rows.times.map do |index|
#       record = Minitest::Mock.new
#       columns.each do |column|
#         record.expect column, "row#{index}"
#         record.expect :to_model, model
#         record.expect :to_model, model
#       end
#       record
#     end
#   end
# end