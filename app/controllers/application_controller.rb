class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :new_guest]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :introduce, :gender, :image])
  end
end
