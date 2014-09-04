module ApplicationHelper

  def image_header(user)
    if user.background_image.present?
      user.background_image.to_s
    else
       User::IMAGES.sample
    end 

    # if current_user.image_header.present?
    #   current_user.image_header
    # else
    #   ["houses.jpg", "palm_trees.jpg", "urban.jpg"].sample  
    # end
   
  end

end
