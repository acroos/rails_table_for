# frozen_string_literal: true

module TestUtils
  def td_for_value(value)
    "<td>#{value}</td>"
  end

  def th_for_title(title = '')
    "<th>#{title}</th>"
  end

  def link_pattern_for_value(value)
    %r{^<td><a href=".*?">#{value}</a></td>$}
  end
end
