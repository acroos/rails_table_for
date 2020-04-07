# frozen_string_literal: true

require 'byebug'

module Helpers
  module Paginate
    include ActionView::Helpers::UrlHelper

    protected

    def pagination_links
      return '' unless paginated?

      content_tag :div, class: 'pagination-links' do
        (1..num_pages).map do |page_number|
          if page_number == current_page_number
            page_number.to_s
          else
            page_link(page_number)
          end
        end.join.html_safe
      end
    end

    def current_page_records
      if paginated?
        start_index = (current_page_number - 1) * page_size
        records.slice(start_index, page_size)
      else
        records
      end
    end

    private

    def paginated?
      page_size != nil
    end

    def num_pages
      full_pages = record_count / page_size
      partial_final_page = (record_count % page_size).zero? ? 0 : 1

      full_pages + partial_final_page
    end

    def current_page_number
      page = request_params[:page]&.to_i || 1
      raise 'Invalid page number' if page < 1 || page > num_pages

      page
    end

    def page_link(page_number)
      path = request_path
      query = request_params.merge({ page: page_number }).to_query
      link_to page_number, "#{path}?#{query}"
    end
  end
end
