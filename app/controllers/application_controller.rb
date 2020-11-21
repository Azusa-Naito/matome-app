class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :status_id, :last_name, :first_name, :last_name_k, :first_name_k, :image, :nickname, :student_number, :name, :name_k, :birthday])
  end
end

