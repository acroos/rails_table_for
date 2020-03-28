require 'test_helper'
require 'byebug'

module Helpers
  class AutoLinkTest < ActiveSupport::TestCase
    include AutoLink
    def test_link
      text = 'link text'
      record = users :one
      link = auto_link(record, text)
      assert_match(/^<a href=".*?">#{text}<\/a>$/, link)
    end

    def test_no_route_available
      text = 'link text'
      record = unrouted_things :one
      assert_raises(NoMethodError) { auto_link(record, text) }
    end
  end
end