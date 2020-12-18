class SubmissionsController < ApplicationController
  before_action :set_classroom, only: [:create, :show, :update, :destroy]
  before_action :set_homework, only: [:create, :show, :update]
  before_action :set_submission, only: [:show, :edit, :update]


  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.valid?
      @submission.save
      redirect_to classroom_homework_path(@classroom.id, @homework.id)
    else
      render "submissions/new"
    end
  end

  def show
    @student = Student.find(@submission.student_id)
  end

  def edit
    if current_student.id != @submission.student_id 
      redirect_to classroom_path(@classroom.id)
    end
  end

  def update
    if @submission.update(submission_params)
      redirect_to classroom_path(@classroom.id)
    else
      render "submissions/edit"
    end
  end

  def destroy
    submission = Submission.find(params[:id])
    if submission.destroy
      redirect_to classroom_path(@classroom.id)
    else
      render "submissions/show"
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:content, :file).merge(homework_id: @homework.id, student_id: current_student.id)
  end
  
  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end

  def set_homework
    @homework = Homework.find(params[:homework_id])
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
