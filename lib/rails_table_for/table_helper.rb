module TableHelper
  def table_for(collection, *args, &block)
    content_tag :table do
    end
  end
end

ActionView::Base.class_eval do
  include TableHelper
end