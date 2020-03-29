require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class BlockColumn < Column
    include Helpers::AutoLink, ActionView::Helpers::TagHelper

    attr_reader :block, :title, :auto_link_enabled
    private :block, :title, :auto_link_enabled

    def initialize(block, **options)
      @block = block
      @title = options[:title]
      @auto_link = options[:auto_link] || false
    end

    def td(record)
      text = block.call(record)
      content = auto_link ? auto_link(record, text) : text
      content_tag :td, content
    end
  end
end