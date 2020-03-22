class Column
  attr_reader :field, :title

  def initialize(field, title = nil)
    if field.nil?
      raise ArgumentError.new("Field cannot be nil")
    end
    @field = field
    @title = title || field.to_s.humanize
  end
end