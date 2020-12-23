class Students::SessionsController < Devise::SessionsController
  def new_guest
    student = Student.guest
    sign_in student
    redirect_to root_path, notice: '学生としてゲストログインしました。'
  end
end