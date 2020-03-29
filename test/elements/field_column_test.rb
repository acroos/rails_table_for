require 'test_helper'
require 'byebug'
require 'test_utils'
 
module Elements
  class FieldColumnTest < ActiveSupport::TestCase
    include TestUtils
    def setup
      @user = users :one
    end

    def test_value
      column = FieldColumn.new(:id)
      value = column.td(@user)
      assert_equal td_for_value(@user.id), value
    end

    def test_missing_field
      assert_raises(ArgumentError) { FieldColumn.new }
    end

    def test_invalid_field
      column = FieldColumn.new(:missing_field)
      assert_raises(NoMethodError) { column.td(@user) }
    end

    def test_auto_title
      column = FieldColumn.new(:id)
      assert_equal th_for_title('Id'), column.th
    end

    def test_manual_title
      title = 'test title'
      column = FieldColumn.new(:id, title: title)
      assert_equal th_for_title(title), column.th
    end

    def test_auto_link
      column = FieldColumn.new(:id, auto_link: true)
      value = column.td(@user)
      assert_match(link_pattern_for_value(@user.id), value)
    end
  end
end