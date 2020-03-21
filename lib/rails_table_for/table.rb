class Table
  include ActionView::Helpers::TagHelper

  attr_accessor :output_buffer

  def initialize(columns:)
    if columns.nil?
      raise ArgumentError.new("Columns must not be nil")
    end
    @columns = columns
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
        @columns.map {|column| content_tag :th, column }.join.html_safe
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
      @columns.map {|column| content_tag :td, record.send(column) }.join.html_safe
    end
  end
end