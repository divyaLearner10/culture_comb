class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :username, :email, :nationality, :phone_number, :gender, :birthday, :about, :current_city, :category_ids])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :username, :email, :nationality, :phone_number, :gender, :birthday, :about, :current_city, :category_ids])
  end
end
