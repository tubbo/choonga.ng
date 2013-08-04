module ApplicationHelper
  def title_tag
    content_tag :title, title_content
  end

  def title_content
    if content_for? :title
      content_for :title
    else
      "choongang: the top 40 of the internet"
    end
  end
end
