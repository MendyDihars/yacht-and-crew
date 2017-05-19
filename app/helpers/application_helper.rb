module ApplicationHelper
  def avatar_url
    if current_user.facebook_picture_url != nil
      return current_user.facebook_picture_url
    elsif current_user.photo != nil
      cl_image_path(current_user.photo.path)
    else
      "http://placehold.it/30x30"
    end
  end

  def date?(date)
    date <= Date.today
  end
end
