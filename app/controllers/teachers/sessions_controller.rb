class Teachers::SessionsController < Devise::SessionsController
  def new_guest
    teacher = Teacher.guest
    sign_in teacher
    redirect_to root_path, notice: '講師としてゲストログインしました。'
  end
end