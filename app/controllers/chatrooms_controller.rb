class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @chatrooms = current_user.sent_chatrooms + current_user.received_chatrooms

    #@chatrooms = Chatroom.all

  end

  def show
    #@chatroom = current_user.chatrooms.find(params[:id])
    #@messages = @chatroom.messages.order(created_at: :asc)
    @messages = @chatroom.messages
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.sender = current_user

    @chatroom.save!

    if @chatroom.save!
      redirect_to chatrooms_path, notice: 'chatroom created successfully.'
    else
      render "chatroom/show", status: :unprocessable_entity
    end
  end

  def destroy
    @chatroom.destroy

    redirect_to chatrooms_path
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :recipient_id)
  end
end
