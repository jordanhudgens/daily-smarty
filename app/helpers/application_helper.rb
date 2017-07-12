module ApplicationHelper
  def google_analytics
    tracking_code = <<~JS
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-101905610-1', 'auto');
      ga('send', 'pageview');
    JS

    javascript_tag(tracking_code)
  end

  def quantcast_javascript
    tracking_code = <<~JS
      var _qevents = _qevents || [];

      (function() {
      var elem = document.createElement('script');
      elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";
      elem.async = true;
      elem.type = "text/javascript";
      var scpt = document.getElementsByTagName('script')[0];
      scpt.parentNode.insertBefore(elem, scpt);
      })();

      _qevents.push({
      qacct:"p-zqHus5X-ax9jb"
      });
    JS

    javascript_tag(tracking_code)
  end

  def quantcast_tracking_pixel
    tracking_pixel = <<~HTML
      <noscript>
      <div style="display:none;">
      <img src="//pixel.quantserve.com/pixel/p-zqHus5X-ax9jb.gif" border="0" height="1" width="1" alt="Quantcast"/>
      </div>
      </noscript>
    HTML

    tracking_pixel.html_safe
  end

  def follow_buttons(user_to_follow: user, logged_in_user: current_user)
    if logged_in_user
      if current_user.following.any? && current_user.following_ids.include?(user_to_follow.id)
        link_to 'Unfollow', follow_toggle_path(user_to_follow.id), class: 'unfollow-link btn btn-danger', remote: true
      else
        link_to 'Follow', follow_toggle_path(user_to_follow.id), class: 'follow-link btn btn-primary', remote: true
      end
    else
      link_to 'Sign Up to Follow', new_user_registration_path, class: 'btn btn-primary'
    end
  end

  def nav_popover(content)
    "data-toggle='popover' data-trigger='hover' data-placement='bottom' data-content='#{content}'"
  end
end
