module ApplicationHelper

  def user_avatar(user)
    image_tag(user.display_avatar, :class => "img-circle", :width => "64", :alt => "user avatar")
  end
end
