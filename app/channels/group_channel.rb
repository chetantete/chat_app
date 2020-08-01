class GroupChannel < ApplicationCable::Channel
  def subscribed
    group = Group.find params[:group]
    stream_for group
  end
end
