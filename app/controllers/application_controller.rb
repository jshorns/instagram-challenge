class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :username, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :username, :email, :password, :current_password)}
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'You must be signed in to do that!'
    end
  end
end
