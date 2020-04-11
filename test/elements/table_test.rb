require 'test_helper'
require 'byebug'
require 'nokogiri'

module RailsTableFor
  module Elements
    class TableTest < ActiveSupport::TestCase
      def setup
        @users = users(:one, :two)
      end

      def test_columns_in_constructor
        table = Table.new(@users, columns: [:id], request_params: {})
        doc = html_doc_for table
        assert_basic_table doc
      end

      def test_no_columns
        table = Table.new(@users, request_params: {})
        html = table.to_s
        assert_equal '', html
      end

      def test_field_column
        table = Table.new(@users, request_params: {})
        table.column(:id)
        doc = html_doc_for table
        assert_basic_table doc
      end

      def test_block_column
        table = Table.new(@users, request_params: {})
        table.column(title: 'Id') {|record| record.id }
        doc = html_doc_for table
        assert_basic_table doc
      end

      def test_pagination_single_page
        expected_links = 0
        table = Table.new(@users, page_size: 5, columns: [:id], request_path: 'path', request_params: {})
        doc = html_doc_for table
        assert_basic_table doc
        assert_pagination_link_count doc, expected_links
      end

      def test_pagination_multiple_pages
        page_size = 1
        expected_links = 1
        table = Table.new(@users, paginate: true, page_size: page_size, columns: [:id], request_path: 'path', request_params: {})
        doc = html_doc_for table
        assert_basic_table doc, expected_rows: page_size
        assert_pagination_link_count doc, expected_links
      end

      private
      def assert_basic_table(html_doc, expected_rows: @users.count)
        assert_is_table html_doc
        assert_col_count html_doc, 1
        assert_row_count html_doc, expected_rows
        assert_equal 'Id', header_for_column(html_doc, 1)
        assert_equal @users.first.id.to_s, row_value_for_column(html_doc, 1, 1)
      end

      def assert_pagination_link_count(html_doc, expected_count)
        link_count = html_doc.xpath('//div[@class="pagination-links"]/a').count
        assert_equal expected_count, link_count
      end

      def assert_col_count(html_doc, expected_count)
        col_count = html_doc.xpath('//thead//th').count
        assert_equal expected_count, col_count
      end

      def assert_row_count(html_doc, expected_count)
        row_count = html_doc.xpath('//tbody//tr').count
        assert_equal expected_count, row_count
      end

      def assert_is_table(html_doc)
        refute_nil html_doc.xpath('//table')
      end

      def html_doc_for(table)
        html = table.to_s
        Nokogiri::HTML(html)
      end

      # xpath is 1-indexed
      def header_for_column(doc, column)
        doc.xpath("//table/thead/tr/th[#{column}]").text
      end

      # xpath is 1-indexed
      def row_value_for_column(doc, row, column)
        doc.xpath("//table/tbody/tr[#{row}]/td[#{column}]").text
      end
    end
  end
end