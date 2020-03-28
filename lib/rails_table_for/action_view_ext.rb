require 'rails_table_for/elements/table'

class ActionView::Base
  include ActionView::Helpers::TagHelper

  def table_for(records, **options)
    def table_for(records, **options)
      table = Elements::Table.new(options)
      if block_given?
        yield table
      end
      table.build(records)
    end
  end
end
