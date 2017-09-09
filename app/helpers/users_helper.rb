module UsersHelper
  def user_index_img_helper(user)
    if UserImage.where(user: user).any?
      image_tag(UserImage.where(user: user).last.img.url)
    else
      image_tag('nav_logo.png')
    end
  end
end
