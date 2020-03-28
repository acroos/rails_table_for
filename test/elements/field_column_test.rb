require 'test_helper'
require 'rails_table_for/elements/field_column'
require 'byebug'
 
module Elements
  class FieldColumnTest < ActiveSupport::TestCase
    def setup
      @user = users :one
    end

    def test_value
      column = FieldColumn.new(:id)
      value = column.value_for(@user)
      assert_equal @user.id, value
    end

    def test_missing_field
      assert_raises(ArgumentError) { FieldColumn.new }
    end

    def test_invalid_field
      column = FieldColumn.new(:missing_field)
      assert_raises(NoMethodError) { column.value_for(@user) }
    end

    def test_auto_title
      column = FieldColumn.new(:id)
      assert_equal 'Id', column.title
    end

    def test_manual_title
      title = 'test title'
      column = FieldColumn.new(:id, title: title)
      assert_equal title, column.title
    end

    def test_auto_link
      column = FieldColumn.new(:id, auto_link: true)
      value = column.value_for(@user)
      assert_match(/^<a href=".*?">#{@user.id}<\/a>$/, value)
    end
  end
end