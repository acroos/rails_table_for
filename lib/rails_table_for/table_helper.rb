module TableHelper
  include ActionView::Helpers::TagHelper

  def table_for(records, *args, &block)
    content_tag :table do
      head(records) + body(records)
    end
  end

  private
  def head(records)
    return '' unless records.any?
    content_tag :thead do
      records.map { |record| header_row(record) }.join.html_safe
    end
  end

  def body(records)
    return '' unless records.any?
    content_tag :tbody do
      records.map { |record| body_row(record) }.join.html_safe
    end
  end

  def header_row(record)
    content_tag :tr do
      content_tag :th, record.primary_key
    end
  end

  def body_row(record)
    content_tag :tr do
      content_tag :td, record.send(record.primary_key)
    end
  end
end

ActionView::Base.class_eval do
  include TableHelper
end