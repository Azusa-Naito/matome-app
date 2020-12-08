class TakeOversController < ApplicationController
  # 学生は全て参照不可
  before_action :authenticate_teacher!

  def new
    @take_over = TakeOver.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @take_over = TakeOver.new(take_over_params)
    if @take_over.valid?
      @take_over.save
      redirect_to classroom_path(@classroom.id)
    else
      render "take_overs/new"
    end
  end

  def show
    @take_over = TakeOver.find(params[:id])
  end

  private
  
  def take_over_params
    params.require(:take_over).permit(:start_time, :content, :detail, :appearance).merge(classroom_id: @classroom.id, teacher_id: current_teacher.id)
  end

end
