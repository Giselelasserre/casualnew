module ApplicationHelper
  def avatar_tag(user)
    if user.avatar.present?
      cl_image_tag user.avatar.path
    else
      if user.facebook_picture_url.present?
        image_tag user.facebook_picture_url
      else
        image_tag "avatar_demo.jpg"
      end
    end
    image_tag
  end
end
