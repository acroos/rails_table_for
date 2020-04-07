# frozen_string_literal: true

require 'byebug'

module Helpers
  module Paginate
    include ActionView::Helpers::UrlHelper

    protected

    def pagination_links
      return '' unless is_paginated?

      content_tag :div, class: 'pagination-links' do
        num_pages.times.map do |i|
          page_number = i + 1
          if page_number == current_page
            page_number.to_s
          else
            page_anchor_tag(page_number)
          end
        end.join.html_safe
      end
    end

    def current_page_records
      if is_paginated?
        start_index = (current_page - 1) * page_size
        records.slice(start_index, page_size)
      else
        records
      end
    end

    private

    def is_paginated?
      page_size != nil
    end

    def num_pages
      full_pages = record_count / page_size
      partial_final_page = (record_count % page_size == 0) ? 0 : 1

      full_pages + partial_final_page
    end

    def current_page
      page = request_params[:page]&.to_i || 1
      if page < 1 || page > num_pages
        raise 'Invalid page number'
      end
      page
    end

    def page_anchor_tag(page_number)
      path = request_path
      query = request_params.merge({page: page_number}).to_query
      link_to page_number, "#{path}?#{query}"
    end
  end
end
