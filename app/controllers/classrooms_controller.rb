class ClassroomsController < ApplicationController
  def index

  end

  def new
    @classroom = Classroom.new
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

  private

  def classroom_params
    params.require(:classroom).permit(:name, :year_month)
  end
end
