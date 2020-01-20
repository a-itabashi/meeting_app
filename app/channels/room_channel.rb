class RoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # ③
  def speak(data)
    meeting = Meeting.find(data['instanceId'])
    meeting = meeting.update!(content: data['content'])

    # ここがエラー
    template = ApplicationController.renderer.render(partial: 'meetings/meeting')
    ActionCable.server.broadcast 'room_channel' ,template
  end
end
