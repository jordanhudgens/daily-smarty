module PostsHelper
  def sanitize_with_whitelist(html)
    return '' unless html

    transformer = lambda do |env|
      if env[:node].element? &&
        env[:node_name] == 'script' &&
        (node_src(env).start_with?("https://gist.github.com/") || node_src(env).start_with?("https://static.codepen.io/assets/embed/ei.js")) &&
        env[:node].text == '' &&
        env[:node].children.empty?
        {node_whitelist: [env[:node]]}
      end
    end

    cleaned_html = Sanitize.fragment(
      html,
      :elements => [
        'header',
        'span',
        'strong',
        'p',
        'h1', 'h2', 'h3', 'h4',
        'img',
        'tt',
        'br',
        'em',
        'u',
        'div'
      ],
      :attributes => {
        'a'    => ['href', 'title', 'class'],
        'span' => ['class'],
        'p'    => ['class'],
        'img'  => ['src', 'class', 'alt', 'style'],
        'div'  => ['class', 'style']
      },
     :transformers => transformer
    )

    cleaned_html
  end

  def node_src(env)
    env[:node].attributes['src'].value
  end


  def auto_link(post_content)
    post_content.gsub(/@\w+/) { |mention| link_to mention, profile_path(mention[1..-1]) }
  end

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
                  <div class='card post-link-card'>
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
                <div class='card post-link-card'>
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
                <div class='card post-link-card'>
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
                <div class='card post-link-card'>
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
