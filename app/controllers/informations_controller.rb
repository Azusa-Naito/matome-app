class InformationsController < ApplicationController
  def index
    @informations = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.valid?
      @information.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
    @information = Information.find(params[:id])
  end

  private

  def information_params
    params.require(:information).permit(:title, :genre_id, :content).merge(teacher_id: current_teacher.id)
  end
end
