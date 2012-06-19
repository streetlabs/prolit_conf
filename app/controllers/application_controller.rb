class ApplicationController < ActionController::Base
  protect_from_forgery

  # checks whether current user is admin or not! {for admin interface}
  def authenticate_admin_user!
    if user_signed_in? && current_user.admin?
      true
    else
      redirect_to new_session_path
    end
  end

  private
  def after_sign_in_path_for(user)
    user.admin? ? admin_dashboard_path : root_path
  end
end
