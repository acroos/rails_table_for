require 'test_helper'
require 'byebug'
require 'test_utils'

module RailsTableFor
  module Elements
    class BlockColumnTest < ActiveSupport::TestCase
      include TestUtils
      def setup
        @user = users :one
        @empty_block = -> _ {}
      end

      def test_constant_value
        const_value = 'value'
        block = -> _ { const_value }
        column = BlockColumn.new(block)
        value = column.td(@user)
        assert_equal td_for_value(const_value), value
      end

      def test_value_from_record
        block = -> record { record.id }
        column = BlockColumn.new(block)
        value = column.td(@user)
        assert_equal td_for_value(@user.id), value
      end

      def test_missing_field
        assert_raises(ArgumentError) { BlockColumn.new }
      end

      def test_invalid_field
        block = -> record { record.invalid_field }
        column = BlockColumn.new(block)
        assert_raises(NoMethodError) { column.td(@user) }
      end

      def test_default_title
        column = BlockColumn.new(@empty_block)
        assert_equal th_for_title, column.th
      end

      def test_manual_title
        title = 'title'
        column = BlockColumn.new(@empty_block, title: title)
        assert_equal th_for_title(title), column.th
      end

      def test_auto_link
        block = -> record { record.id }
        column = BlockColumn.new(block, auto_link: true)
        value = column.td(@user)
        assert_match(link_pattern_for_value(@user.id), value)
      end
    end
  end
end
