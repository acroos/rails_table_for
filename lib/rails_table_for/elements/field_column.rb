# frozen_string_literal: true

require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class FieldColumn < Column
    include ActionView::Helpers::TagHelper
    include Helpers::AutoLink

    attr_reader :field, :title, :auto_link_enabled
    private :field, :title, :auto_link_enabled

    def initialize(field, **options)
      raise('Field cannot be nil', ArgumentError) if field.nil?

      @field = field
      @title = options[:title] || field.to_s.humanize
      @auto_link_enabled = options[:auto_link] || false
    end

    def td(record)
      text = record.send(field)
      content = auto_link_enabled ? auto_link(record, text) : text
      content_tag :td, content
    end
  end
end
