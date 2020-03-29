# frozen_string_literal: true

module Elements
  class Column
    def th
      content_tag :th, title
    end

    def td(_)
      raise 'Not implemented'
    end
  end
end
