require 'test_helper'
require 'byebug'
require 'nokogiri'
 
module Elements
  class TableTest < ActiveSupport::TestCase
    def setup
      @users = users(:one, :two)
    end

    def test_columns_in_constructor
      table = Table.new(@users, columns: [:id])
      assert_id_only_table table
    end

    def test_no_columns
      table = Table.new(@users)
      html = table.to_s
      assert_equal '', html
    end

    def test_field_column
      table = Table.new(@users)
      table.column(:id)
      assert_id_only_table table
    end

    def test_block_column
      table = Table.new(@users)
      table.column(title: 'Id') {|record| record.id }
      assert_id_only_table table
    end

    private
    def assert_id_only_table(table)
      html = table.to_s
      doc = Nokogiri::HTML(html)
      refute_nil doc.xpath('//table')
      row_count = doc.xpath('//tbody//tr').count
      col_count = doc.xpath('//thead//th').count
      assert_equal @users.count, row_count
      assert_equal 1, col_count
      assert_equal 'Id', header_for_column(doc, 1)
      assert_equal @users.first.id.to_s, row_value_for_column(doc, 1, 1)
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