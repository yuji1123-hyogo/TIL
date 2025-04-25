class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'general'
    stream_from params[:topic]
  end

  def unsubscribed

  end

  def sendMessage(data)
    # ActionCable.server.broadcast 'general', { name: data['name'], body: data['body'] }
    # Message.create topic: 'general', name: data['name'], body: data['body']

    # トピックを分割する場合
    ActionCable.server.broadcast data['topic'],
      { name: data['name'], body: data['body'] }
    Message.create(topic: data['topic'], name: data['name'], body: data['body'])
  end
end
