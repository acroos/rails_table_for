require 'rails_table_for/auto_link_helper'
require 'rails_table_for/column'

class BlockColumn < Column
  include AutoLinkHelper
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