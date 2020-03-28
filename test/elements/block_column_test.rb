require 'test_helper'
require 'byebug'
 
module Elements
  class BlockColumnTest < ActiveSupport::TestCase
    def setup
      @user = users :one
      @empty_block = -> _ {}
    end

    def test_constant_value
      const_value = 'value'
      block = -> _ { const_value }
      column = BlockColumn.new(block)
      value = column.value_for(@user)
      assert_equal const_value, value
    end

    def test_value_from_record
      block = -> record { record.id }
      column = BlockColumn.new(block)
      value = column.value_for(@user)
      assert_equal @user.id, value
    end

    def test_missing_field
      assert_raises(ArgumentError) { BlockColumn.new }
    end

    def test_invalid_field
      block = -> record { record.invalid_field }
      column = BlockColumn.new(block)
      assert_raises(NoMethodError) { column.value_for(@user) }
    end

    def test_default_title
      column = BlockColumn.new(@empty_block)
      assert_nil column.title
    end

    def test_manual_title
      title = 'title'
      column = BlockColumn.new(@empty_block, title: title)
      assert_equal title, column.title
    end

    def test_auto_link
      block = -> record { record.id }
      column = BlockColumn.new(block, auto_link: true)
      value = column.value_for(@user)
      assert_match(/^<a href=".*?">#{@user.id}<\/a>$/, value)
    end
  end
end