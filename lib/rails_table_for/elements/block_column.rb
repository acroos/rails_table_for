require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class BlockColumn < Column
    include Helpers::AutoLink
    attr_reader :title

    def initialize(block, **options)
      @block = block
      @title = options[:title]
      @auto_link = options[:auto_link] || false
    end

    def value_for(record)
      text = @block.call(record)
      @auto_link ? auto_link(record, text) : text
    end
  end
end