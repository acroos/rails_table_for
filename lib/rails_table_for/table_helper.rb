module TableHelper
  def table_for(collection, *args, &block)
    'table'
  end
end

ActionView::Base.class_eval do
  include TableHelper
end