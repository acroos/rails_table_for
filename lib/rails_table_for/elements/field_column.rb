require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class FieldColumn < Column
    include Helpers::AutoLink, ActionView::Helpers::TagHelper

    def initialize(field, **options)
      if field.nil?
        raise ArgumentError.new("Field cannot be nil")
      end
      @field = field
      @title = options[:title] || field.to_s.humanize
      @auto_link = options[:auto_link] || false
    end

    def th
      content_tag :th, @title
    end

    def td(record)
      text = record.send(@field)
      content = @auto_link ? auto_link(record, text) : text
      content_tag :td, content
    end
  end
end