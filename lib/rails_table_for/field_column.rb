require 'rails_table_for/column'

class FieldColumn < Column
  attr_reader :title

  def initialize(field, title = nil)
    if field.nil?
      raise ArgumentError.new("Field cannot be nil")
    end
    @field = field
    @title = title || field.to_s.humanize
  end

  def value_for(record)
    record.send(@field)
  end
end