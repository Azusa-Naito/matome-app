class TakeOversController < ApplicationController
  # 学生は全て参照不可
  before_action :authenticate_teacher!
  before_action :set_classroom, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_take_over, only: [:show, :edit, :update]


  def new
    @take_over = TakeOver.new
  end

  def create
    @take_over = TakeOver.new(take_over_params)
    if @take_over.valid?
      @take_over.save
      redirect_to classroom_path(@classroom.id)
    else
      render "take_overs/new"
    end
  end

  def show
  end

  def edit
    if current_teacher.id != @take_over.teacher_id 
      redirect_to classroom_path(@classroom.id)
    end
  end

  def update
    if @take_over.update(take_over_params)
      redirect_to classroom_path(@classroom.id)
    else
      render "take_overs/edit"
    end
  end

  def destroy
    take_over = TakeOver.find(params[:id])
    if take_over.destroy
      redirect_to classroom_path(@classroom.id)
    else
      render "take_overs/show"
    end
  end

  private
  
  def take_over_params
    params.require(:take_over).permit(:start_time, :content, :detail, :appearance, :judgement).merge(classroom_id: @classroom.id, teacher_id: current_teacher.id)
  end

  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end

  def set_take_over
    @take_over = TakeOver.find(params[:id])
  end
end
