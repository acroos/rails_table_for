# frozen_string_literal: true

require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class BlockColumn < Column
    include ActionView::Helpers::TagHelper
    include Helpers::AutoLink

    attr_reader :block, :title, :auto_link_enabled
    private :block, :title, :auto_link_enabled

    def initialize(block, **options)
      @block = block
      @title = options[:title]
      @auto_link_enabled = options[:auto_link] || false
    end

    def td(record)
      text = block.call(record)
      content = auto_link_enabled ? auto_link(record, text) : text
      content_tag :td, content
    end
  end
end
