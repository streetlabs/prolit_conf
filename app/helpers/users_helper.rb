module UsersHelper
  def user_signout_link
    method = Rails.env.test? ? :get : :delete
    link_to("LOGOUT", destroy_user_session_path, :method => method)
  end
end
