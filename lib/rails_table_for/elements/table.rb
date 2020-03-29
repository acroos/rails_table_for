# frozen_string_literal: true

require 'rails_table_for/elements/block_column'
require 'rails_table_for/elements/field_column'

module Elements
  class Table
    include ActionView::Helpers::TagHelper

    attr_accessor :columns, :options, :output_buffer
    private :columns, :options

    def initialize(**options)
      columns = options[:columns] || []
      @columns = columns.map do |field|
        FieldColumn.new(field)
      end
      @options = options
    end

    def column(field = nil, **options, &block)
      if block_given?
        columns << BlockColumn.new(block, options)
      elsif field
        columns << FieldColumn.new(field, options)
      else
        raise 'Must provide either field or block'
      end
    end

    def build(records)
      return '' if records.nil? || records.empty?
      return '' if columns.nil? || columns.empty?

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
          columns.map(&:th).join.html_safe
        end
      end
    end

    def body(records)
      content_tag :tbody do
        records.map { |record| body_row(record) }.join.html_safe
      end
    end

    def body_row(record)
      content_tag :tr do
        columns.map { |column| column.td(record) }.join.html_safe
      end
    end
  end
end
