module Elements
  class Column
    def th
      content_tag :th, @title
    end

    def td(record)
      raise 'Not implemented'
    end
  end
end