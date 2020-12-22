module ApplicationHelper
  def display_main_navbar_options
    capture do
      if user_signed_in?
        concat link_to "Odjava", destroy_user_session_path, method: :delete
      else
        concat link_to "Prijava", new_user_session_path
        concat " "
        concat link_to "Registracija", new_user_registration_path
      end
    end
  end
end
