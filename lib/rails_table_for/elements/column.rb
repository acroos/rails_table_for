# frozen_string_literal: true

module RailsTableFor
  module Elements
    module Column
      def th
        content_tag :th, title
      end

      def td(_)
        raise 'Not implemented'
      end
    end
  end
end
