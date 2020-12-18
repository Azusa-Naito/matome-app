class HomeworksController < ApplicationController
  before_action :authenticate_teacher!, except: [:show]
  before_action :set_classroom, only: [:create, :show, :update, :destroy]
  before_action :set_homework, only: [:show, :edit, :update]
  
  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)
    if @homework.valid?
      @homework.save
      redirect_to classroom_path(@classroom.id)
    else
      render "homeworks/new"
    end
  end

  def show
  end

  def edit
    if current_teacher.id != @homework.teacher_id 
      redirect_to root_path
    end
  end

  def update
    if @homework.update(homework_params)
      redirect_to classroom_path(@classroom.id)
    else
      render "homeworks/edit"
    end
  end

  def destroy
    homework = Homework.find(params[:id])
    if homework.destroy
      redirect_to classroom_path(@classroom.id)
    else
      render "homeworks/show"
    end
  end

  private

  def homework_params
    params.require(:homework).permit(:start_time, :content, :judgement, :file).merge(classroom_id: @classroom.id, teacher_id: current_teacher.id)
  end

  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end

  def set_homework
    @homework = Homework.find(params[:id])
  end
end
