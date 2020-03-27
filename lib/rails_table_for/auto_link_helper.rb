module AutoLinkHelper
  include ActionView::RoutingUrlFor

  def auto_link(record, text)
    path = Rails.application.routes.url_helpers.url_for(record)
    link_to(text, path)
  end
end