module ApplicationHelper

  #navbar gumbi helper
  def display_main_navbar_options
    capture do
      if user_signed_in?
        concat link_to 'Upload video', new_video_path, :class=>'dropdown-item'
        concat "    "
        concat link_to "Edit my profile", edit_user_registration_path, :class=>"dropdown-item"
        concat "    "
        concat link_to "Sign out", destroy_user_session_path, method: :delete, :class=>'dropdown-item'
      else
        concat link_to "Sign in", new_user_session_path, :class=>'dropdown-item'
        concat "    "
        concat link_to "Register", new_user_registration_path, :class=>'dropdown-item'
      end
    end
  end

  #like-dislike helper
  def like_dislike
    capture do
      if user_signed_in?
        if current_user.voted_up_on? @video
          concat link_to "👍 #{@video.get_likes.size}", like_video_path(@video), :class=>"btn btn-secondary", method: :put
          concat "  "
        else
          concat link_to "👍 #{@video.get_likes.size}", like_video_path(@video), :class=>"btn btn-outline-secondary", method: :put
          concat "  "
        end
        if current_user.voted_down_on? @video
          concat link_to "👎 #{@video.get_dislikes.size}", dislike_video_path(@video), :class=>"btn btn-secondary", method: :put
        else
          concat link_to "👎 #{@video.get_dislikes.size}", dislike_video_path(@video), :class=>"btn btn-outline-secondary", method: :put
        end
      else
        concat link_to "👍 #{@video.get_likes.size}",  new_user_session_path, :class=>"btn btn-outline-secondary"
        concat "  "
        concat link_to "👎 #{@video.get_dislikes.size}", new_user_session_path, :class=>"btn btn-outline-secondary"
      end
    end
  end

  def user_subscribe
    concat @video.user.subscribers.count
    concat " Subscribers \n"
    if user_signed_in?
      if @subscription.present?
        link_to "Unsubscribe", subscription_path(@subscription.id),class: 'btn btn-outline-secondary', method: :delete
      else
        link_to "Subscribe", user_subscriptions_path(@video.user.id),class: 'btn btn-outline-secondary', method: :post
      end
    else
      link_to "Subscribe", new_user_session_path(),class: 'btn btn-outline-secondary'
    end
  end

  #user display helper
  #def user_display
    #if user_signed_in?
      #concat current_user.name
      #if current_user.profilePic.attached?
        #concat image_tag current_user.profilePic, class: 'profileIMG'
      #else
        #concat image_tag "blank_profile.png", class: "profileIMG"
      #end
    #else
      #concat "You are not logged in. "
    #end
  #end

end
