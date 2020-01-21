class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # ③
  def speak(data)
    Meeting.find(data['instanceId']).update!(content: data['content'])
    meeting = Meeting.find(data['instanceId'])
    template = ApplicationController.renderer.render(partial: 'meetings/meeting', locals: {meeting: meeting})
    ActionCable.server.broadcast 'room_channel' ,template
  end
end
