class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @information = Information.find(params[:information_id])
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      @inquiry.save
      redirect_to information_path(@information.id)
    else
      render "informations/show"
    end
  end

  private

  def inquiry_params
    if teacher_signed_in?
      params.require(:inquiry).permit(:content).merge(information_id: params[:information_id], teacher_id: current_teacher.id)
    elsif student_signed_in?
      params.require(:inquiry).permit(:content).merge(information_id: params[:information_id], student_id: current_student.id)
    end
  end
end
