class VmsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vmStream'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
