require 'rails_table_for/table'

module TableHelper
  include ActionView::Helpers::TagHelper

  def table_for(records, columns: [])
    table = Table.new(columns: columns)
    if block_given?
      yield table
    end
    table.build(records)
  end
end

ActionView::Base.class_eval do
  include TableHelper
end