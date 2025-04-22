class MessagesController < ApplicationController
  def index
    @messages = Message.order('created_at desc').last(10)
  end

  def create
    Message.create(message_params)
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
