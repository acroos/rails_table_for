# frozen_string_literal: true

require 'test_helper'

module RailsTableFor
  class Test < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, RailsTableFor
    end
  end
end
