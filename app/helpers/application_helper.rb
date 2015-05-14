module ApplicationHelper

  def coach_sex_options
    [ ["男","m"], ["女", "f"] ]
  end

  def coach_status_options
    [ ["發布","published"], ["草稿", "draft"] ]
  end

  def user_avatar(user)
    image_tag(user.display_avatar, :class => "img-thumbnail", :width => "35", :alt => "user avatar")
  end
end
