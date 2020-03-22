require 'rails_table_for/column'

class Table
  include ActionView::Helpers::TagHelper

  attr_accessor :output_buffer

  def initialize(columns:)
    @columns = columns.map do |field|
      Column.new(field)
    end
  end

  def column(field, **args)
    title = args[:title] || args['title']
    @columns << Column.new(field, title)
  end

  def build(records)
    return '' if records.nil? || records.empty?
    table(records)
  end

  private
  def table(records)
    content_tag :table do
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
      @columns.map {|column| content_tag :td, record.send(column.field) }.join.html_safe
    end
  end
end