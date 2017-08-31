module PostsHelper
  def social_icon_renderer(provider)
    if provider == 'facebook'
      'fa-facebook-official'
    elsif provider == 'twitter'
      'fa-twitter-square'
    end
  end

  def post_thumb(post)
    if post.img.post_thumb.blank?
      image_tag('empty-thumb.png')
    else
      image_tag(post.img.post_thumb)
    end
  end

  def post_link_formatter(post_link)
    begin
      link = LinkThumbnailer.generate(post_link)
      post_link_mapper(link)
    rescue LinkThumbnailer::Exceptions, Net::HTTP::Persistent::Error => e
      content = <<~EOL
                  <div class='card'>
                    <div class='row'>
                      <div class='col-md-12'>
                        <h2>
                          <a href='#{post_link}' target='_blank'>#{post_link}</a>
                        </h2>
                      </div>
                    </div>
                  </div>
                EOL
      content_tag(:div, content.html_safe, class: 'post-link-wrapper')
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
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-12'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end

  def format_video_link(link)
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-4'>
                      <div>#{link.videos.first.embed_code}</div>
                    </div>
                    <div class='col-md-8'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end

  def format_image_link(link)
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-4'>
                      <img src='#{link.images.first.src.to_s}'>
                    </div>
                    <div class='col-md-8'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end
end
