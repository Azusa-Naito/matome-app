class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
    if teacher_signed_in?
      @classrooms_hr = Classroom.where(teacher_id: current_teacher.id)
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
    @informations = Information.all
  end

  private

  def classroom_params
    # 中間テーブルのレコードは一つずつ作成しているため、idsとはならない
    params.require(:classroom).permit(:name, :year_month, classroom_teachers_attributes: [:id, :teacher_id, :room_id, :_destroy], classroom_students_attributes: [:id, :student_id, :room_id, :_destroy]).merge(teacher_id: current_teacher.id)
  end
end
