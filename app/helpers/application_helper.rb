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
end
