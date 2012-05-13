module ApplicationHelper
  def current_page_link(path)
    request.path == path ? "current" : ""
  end
end
