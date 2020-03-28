require 'rails_table_for/helpers/auto_link'
require 'rails_table_for/elements/column'

module Elements
  class FieldColumn < Column
    include Helpers::AutoLink
    attr_reader :title

    def initialize(field, **options)
      if field.nil?
        raise ArgumentError.new("Field cannot be nil")
      end
      @field = field
      @title = options[:title] || field.to_s.humanize
      @auto_link = options[:auto_link] || false
    end

    def value_for(record)
      text = record.send(@field)
      @auto_link ? auto_link(record, text) : text
    end
  end
end