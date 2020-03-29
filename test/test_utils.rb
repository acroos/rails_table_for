module TestUtils
  def td_for_value(value)
    "<td>#{value}</td>"
  end

  def th_for_title(title = '')
    "<th>#{title}</th>"
  end

  def link_pattern_for_value(value)
    /^<td><a href=".*?">#{value}<\/a><\/td>$/
  end
end