# frozen_string_literal: true

require 'rails_table_for/elements/table'

module RailsTableFor
  module TableHelper
    include ActionView::Helpers::TagHelper

    def table_for(records, **options)
      options.merge!(request_options)
      table = Elements::Table.new(records, options)
      yield table if block_given?
      table.to_s
    end

    private

    def request_options
      {
        request_path: request.path,
        request_params: request.params.except(:action, :controller)
      }
    end
  end
end

ActionView::Base.class_eval do
  include RailsTableFor::TableHelper
end
