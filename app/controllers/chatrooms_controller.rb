class ChatroomsController < ApplicationController
  def new
    # @chatroom = Chatroom.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    if teacher_signed_in?
      @student = Student.find(params[:student])
      @chatroom = Chatroom.where(classroom_id: @classroom.id, student_id: @student.id, teacher_id: current_teacher.id)
    elsif student_signed_in?
      @teacher = Teacher.where(id: @classroom.teacher_id)
      @chatroom = Chatroom.where(classroom_id: @classroom.id, student_id: current_student.id, teacher_id: @classroom.teacher_id)
    end
    # 条件分岐
    # 学生のチャットルームが既に存在したら
    if @chatroom.present?
    # if Chatroom.exists?(classroom_id: @classroom.id, student_id: @student.id, teacher_id: current_teacher.id)
      redirect_to classroom_chatroom_path(@classroom.id, @chatroom[0].id)
    else #学生とのチャットルームが存在しなかったら
      @chatroom = Chatroom.new(chatroom_params)
      if @chatroom.valid?
        @chatroom.save
        redirect_to classroom_chatroom_path(@classroom.id, @chatroom.id)
      else
        render 'classrooms#show'
      end
    end
  end

  def show
    @classroom = Classroom.find(params[:classroom_id])
    @chatroom = Chatroom.find(params[:id])
    @teacher = @chatroom.teacher
    @student = @chatroom.student
    @chats = Chat.where(chatroom_id: @chatroom.id)
    @chat = Chat.new
    # チャットを既読にする
    if teacher_signed_in?
      @chats.where(judgement: 2, checked: false).each do |checked|
        checked.update_attributes(checked: true)
      end
    elsif student_signed_in?
      @chats.where(judgement: 1, checked: false).each do |checked|
        checked.update_attributes(checked: true)
      end
    end  
  end

  private

  def chatroom_params
    if teacher_signed_in?
      params.permit().merge(classroom_id: @classroom.id, teacher_id: current_teacher.id, student_id: @student.id)
    elsif student_signed_in?
      params.permit().merge(classroom_id: @classroom.id, teacher_id: @teacher.id, student_id: current_student.id)
    end
  end
end
