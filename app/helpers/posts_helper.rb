module PostsHelper
  def post_link_formatter(post_link)
    begin
      link = LinkThumbnailer.generate(post_link)
      post_link_mapper(link)
    rescue LinkThumbnailer::Exceptions => e
      return content_tag(:div, 'There was an error loading this link')
    end
  end

  def post_link_mapper(link)
    if !link.videos.empty?
      format_video_link(link)
    elsif !link.images.empty?
      format_image_link(link)
    else
      format_title_link(link)
    end
  end

  def format_title_link(link)
    content_tag :div, class: 'card' do
      content_tag(:h2, link.title)
      content_tag(:p, link.description)
    end
  end

  def format_video_link(link)
    content = <<~EOL
                <h2>#{link.title}</h2>
                <p>#{link.description}</p>
              EOL
    content_tag(:div, content.html_safe, class: 'card')
  end

  def format_image_link(link)
    content_tag :div, class: 'card' do
      content_tag(:h2, link.title)
      content_tag(:p, link.description)
    end
  end
end
