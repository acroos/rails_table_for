module TableHelper
  def table_for(records, *args, &block)
    content_tag :table do
      head(records) + body(records)
    end
  end

  private
  def head(records)
    return '' unless records.any?
    content_tag :thead do
      records.map do |record|
        content_tag :tr do
          content_tag :th, 'id'
        end
      end.join.html_safe
    end
  end

  def body(records)
    return '' unless records.any?
    content_tag :tbody do
      records.map do |record|
        content_tag :tr do
          content_tag :td, record.id
        end
      end.join.html_safe
    end
  end
end

ActionView::Base.class_eval do
  include TableHelper
end