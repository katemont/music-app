module ApplicationHelper

  def image_header(user)
    if user.background_image.present?
      user.background_image.to_s
    else
       User::IMAGES.sample
    end 

  end

end
