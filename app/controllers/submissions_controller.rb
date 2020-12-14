class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @homework = Homework.find(params[:homework_id])
    @submission = Submission.new(homework_params)
    if @submission.valid?
      @submission.save
      redirect_to classroom_homework_path(@classroom.id, @homework.id)
    else
      render "submissions/new"
    end
  end

  def show
    @submission = submission.find(params[:id])
  end


  private

  def homework_params
    params.require(:submission).permit(:content, :file).merge(homework_id: @homework.id, student_id: current_student.id)
  end
  
end
