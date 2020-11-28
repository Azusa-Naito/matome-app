class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # 先生がログインしてたら学生のログインページには行けない

  # 学生がログインしてたら先生のログインページには行けない

  private

  def configure_permitted_parameters
    if resource_class == Teacher
      devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :status_id, :last_name, :first_name, :last_name_k, :first_name_k, :image, :nickname])
    elsif resource_class == Student
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :nickname, :student_number, :name, :name_k, :birthday])
    else
      super
    end
  end
end

