class InformationsController < ApplicationController
  # 学生は一部参照不可
  before_action :authenticate_teacher!, except: [:index, :show]
  before_action :set_information, only: [:show, :edit, :update]


  def index
    @informations = Information.all.order('created_at DESC')
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
    @inquiry = Inquiry.new
    @inquiries = Inquiry.where(information_id: params[:id])
    @inquiries.each do |inquiry|
      if inquiry.teacher_id.present?
        @teacher = Teacher.find(inquiry.teacher_id)
      elsif inquiry.student_id.present?
        @student = Student.find(inquiry.student_id)
      end
    end
  end

  def edit
    if current_teacher.id != @information.teacher_id 
      redirect_to root_path
    end
  end

  def update
    if @information.update(information_params)
      redirect_to root_path
    else
      render "informations/edit"
    end
  end

  def destroy
    information = Information.find(params[:id])
    if information.destroy
      redirect_to root_path
    else
      render "informations/show"
    end
  end

  private

  def information_params
    params.require(:information).permit(:title, :genre_id, :content).merge(teacher_id: current_teacher.id)
  end

  def set_information
    @information = Information.find(params[:id])
  end
end
