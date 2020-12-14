class HomeworksController < ApplicationController
  before_action :authenticate_teacher!, only: [:new, :create]
  
  def new
    @homework = Homework.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @homework = Homework.new(homework_params)
    if @homework.valid?
      @homework.save
      redirect_to classroom_path(@classroom.id)
    else
      render "homeworks/new"
    end
  end

  def show
    @homework = Homework.find(params[:id])
  end


  private

  def homework_params
    params.require(:homework).permit(:start_time, :content, :file, :judgement).merge(classroom_id: @classroom.id, teacher_id: current_teacher.id)
  end
end
