module ApplicationHelper
  def render_last_comments(condition, comments)
    if condition
      content_tag(:div, content_tag(:p, "No comment"), class: "caption")
    else
      content_tag(:div, class: "caption") { comments.collect {|item| concat(content_tag(:p, truncate(item, length: 29)))} }
    end
  end
end
