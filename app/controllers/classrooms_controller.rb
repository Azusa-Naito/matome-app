class ClassroomsController < ApplicationController
  def index
    if teacher_signed_in?
      # 担任クラス
      @classrooms_hr = Classroom.where(teacher_id: current_teacher.id)
      # 授業だけのクラス
      @classrooms_cl = current_teacher.classrooms
      @classrooms = Classroom.all
    elsif student_signed_in?
      @classrooms_st = current_student.classrooms
    end
  end

  def new
    @classroom = Classroom.new
    # @classroom_teacher = @classroom.classroom_teachers.build
    # @classroom_student = @classroom.classroom_students.build
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.valid?
      @classroom.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @informations = Information.all
    @chatroom = Chatroom.new
  end

  private

  def classroom_params
    # 中間テーブルのレコードは一つずつ作成しているため、idsとはならない
    params.require(:classroom).permit(:name, :year_month, classroom_teachers_attributes: [:id, :teacher_id, :room_id, :_destroy], classroom_students_attributes: [:id, :student_id, :room_id, :_destroy]).merge(teacher_id: current_teacher.id)
  end
end
