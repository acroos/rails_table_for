require 'rails_table_for/elements/block_column'
require 'rails_table_for/elements/field_column'

module Elements
  class Table
    include ActionView::Helpers::TagHelper

    attr_accessor :output_buffer

    def initialize(**options)
      columns = options[:columns] || []
      @columns = columns.map do |field|
        FieldColumn.new(field)
      end
      @options = options
    end

    def column(field=nil, **options, &block)
      if field.nil? && !block_given?
        raise 'Must provide either field or block'
      end

      if block_given?
        @columns << BlockColumn.new(block, options)
      else
        @columns << FieldColumn.new(field, options)
      end
    end

    def build(records)
      return '' if records.nil? || records.empty?
      return '' if @columns.nil? || @columns.empty?
      table(records)
    end

    private
    def table(records)
      content_tag :table, class: @options[:class] do
        [head, body(records)].join.html_safe
      end
    end

    def head
      content_tag :thead do
        content_tag :tr do
          @columns.map {|column| content_tag :th, column.title }.join.html_safe
        end
      end
    end

    def body(records)
      content_tag :tbody do
        records.map {|record| body_row(record) }.join.html_safe
      end
    end

    def body_row(record)
      content_tag :tr do
        @columns.map {|column| content_tag :td, column.value_for(record) }.join.html_safe
      end
    end
  end
end