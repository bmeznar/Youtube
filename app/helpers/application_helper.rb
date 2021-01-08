module ApplicationHelper
  def display_main_navbar_options
    capture do
      if user_signed_in?
        concat link_to 'Naloži video', new_video_path, :class=>'btn btn-outline-secondary'
        concat "    "
        #concat link_to 'Uredi profil', edit_user_registration, :class=>'btn btn-outline-secondary'
        concat "    "
        concat link_to "Odjava", destroy_user_session_path, method: :delete, :class=>'btn btn-outline-secondary'
      else
        concat link_to "Prijava", new_user_session_path, :class=>'btn btn-outline-secondary'
        concat "    "
        concat link_to "Registracija", new_user_registration_path, :class=>'btn btn-outline-secondary'
      end
    end
  end

  def like_dislike
    capture do
      if user_signed_in?
        if current_user.voted_up_on? @video
          concat link_to "👍 #{@video.get_likes.size}", like_video_path(@video), :class=>"btn btn-secondary", method: :put
        else
          concat link_to like_video_path(@video), :class=>"btn btn-outline-secondary", method: :put do
            concat "👍 "
            concat @video.get_likes.size
          end
        end
        if current_user.voted_down_on? @video
          concat link_to "👍 #{@video.get_likes.size}", dislike_video_path(@video), :class=>"btn btn-secondary", method: :put
        else
          concat link_to "👎 #{@video.get_dislikes.size}", dislike_video_path(@video), :class=>"btn btn-outline-secondary", method: :put
        end
      else
        concat link_to "👍 #{@video.get_likes.size}",  new_user_session_path, :class=>"btn btn-outline-secondary"
        concat link_to "👎 #{@video.get_dislikes.size}", new_user_session_path, :class=>"btn btn-outline-secondary"
      end
    end
  end

end
