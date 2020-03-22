require 'rails_table_for/column'

class BlockColumn < Column
  attr_reader :title

  def initialize(block, title)
    @block = block
    @title = title
  end

  def value_for(record)
    @block.call(record)
  end
end