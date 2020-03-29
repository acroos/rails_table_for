# frozen_string_literal: true

require 'rails_table_for/elements/table'

module TableHelper
  include ActionView::Helpers::TagHelper

  def table_for(records, **options)
    options.merge(request_options)
    table = Elements::Table.new(options)
    yield table if block_given?
    table.build(records)
  end

  private

  def request_options
    {
      request_path: request.fullpath,
      request_params: request.params
    }
  end
end

ActionView::Base.class_eval do
  include TableHelper
end
