class ChatsController < ApplicationController

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat = Chat.new(chat_params)
    # @chat = @chatroom.chats.new(chat_params)
    if @chat.valid?
      @chat.save
      redirect_to classroom_chatroom_path(@classroom.id, @chatroom.id)
    else
      render "chats/show"
    end
  end

  private

  # 学生と先生の区別はなし（もしjudgementをcontrollerに記述するなら条件分岐する）
  def chat_params
      params.require(:chat).permit(:text, :judgement).merge(chatroom_id: @chatroom.id)
  end
end
