class GroupMessagesController < ApplicationController
  before_action :load_entities

  def create
    @group_message = GroupMessage.create user: current_user,
                                   group: @group,
                                   message: params.dig(:group_message, :message)

	  GroupChannel.broadcast_to @group, @group_message
  end

  protected

  def load_entities
    @group = Group.find params.dig(:group_message, :group_id)
  end
end