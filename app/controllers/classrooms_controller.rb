class ClassroomsController < ApplicationController
  # 学生はnewページ参照不可
  before_action :authenticate_teacher!, only: [:new, :create]
  before_action :set_classroom, only: [:show, :edit, :update]

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
    @informations = Information.all.order(id: "DESC").page(params[:page]).per(5)
    @chatroom = Chatroom.new
    @take_over = TakeOver.where(classroom_id: @classroom.id)
    @homework = Homework.where(classroom_id: @classroom.id)
    @all = @take_over + @homework
    @teacher = Teacher.find_by(id: @classroom.teacher_id)
  end

  def edit
    if current_teacher.id != @classroom.teacher_id 
      redirect_to root_path
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classroom_path(@classroom.id)
    else
      render "classrooms/edit"
    end
  end

  def destroy
    classroom = Classroom.find(params[:id])
    if classroom.destroy
      redirect_to root_path
    else
      render "classrooms/show"
    end
  end

  private

  def classroom_params
    # 中間テーブルのレコードは一つずつ作成しているため、idsとはならない
    params.require(:classroom).permit(:name, :year_month, classroom_teachers_attributes: [:id, :teacher_id, :room_id, :_destroy], classroom_students_attributes: [:id, :student_id, :room_id, :_destroy]).merge(teacher_id: current_teacher.id)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end
