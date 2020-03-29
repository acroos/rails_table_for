# frozen_string_literal: true

module Helpers
  module AutoLink
    include ActionView::Helpers::UrlHelper

    def auto_link(record, text)
      path = Rails.application.routes.url_helpers.polymorphic_path(record)
      link_to(text, path)
    end
  end
end
