require 'rails_table_for/elements/table'

module TableHelper
  include ActionView::Helpers::TagHelper

  def table_for(records, **options)
    options.merge({
      request_path: request.fullpath,
      request_params: request.params
    })
    table = Elements::Table.new(options)
    if block_given?
      yield table
    end
    table.build(records)
  end
end

ActionView::Base.class_eval do
  include TableHelper
end