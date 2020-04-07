# frozen_string_literal: true

require 'rails_table_for/elements/block_column'
require 'rails_table_for/elements/field_column'
require 'rails_table_for/helpers/paginate'

module Elements
  class Table
    include Helpers::Paginate
    include ActionView::Helpers::TagHelper

    attr_accessor :columns, :output_buffer, :page_size, :record_count, :records, :request_params,
                  :request_path
    private :columns, :page_size, :record_count, :records, :request_params, :request_path

    def initialize(records, **options)
      @records = records
      @record_count = records.count
      @columns = []
      options[:columns]&.each { |field| column(field) }
      @page_size = options[:page_size]
      @request_path = options[:request_path]
      @request_params = options[:request_params]
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

    def to_s
      return '' if record_count.zero?
      return '' if columns.nil? || columns.empty?

      draw
    end

    private

    def draw
      content_tag :div do
        table + pagination_links
      end
    end

    def table
      content_tag :table do
        head + body
      end
    end

    def head
      content_tag :thead do
        content_tag :tr do
          columns.map(&:th).join.html_safe
        end
      end
    end

    def body
      content_tag :tbody do
        current_page_records.map { |record| body_row(record) }.join.html_safe
      end
    end

    def body_row(record)
      content_tag :tr do
        columns.map { |column| column.td(record) }.join.html_safe
      end
    end
  end
end
