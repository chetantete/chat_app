class GroupsController < ApplicationController
before_action :load_entities
before_action :load_users, only: [:new, :edit]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new permitted_parameters
    @group.users << current_user
    @group.users << User.where(id: params[:group][:users].reject(&:empty?))
    if @group.save
      flash[:success] = "group #{@group.name} was created successfully"
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group_message = GroupMessage.new group: @group
    @group_messages = @group.group_messages.includes(:user)
  end

  def edit
  end

  def update
    if @group.update_attributes(permitted_parameters)
      flash[:success] = "group #{@group.name} was updated successfully"
      redirect_to groups_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @groups = Group.all
    @group = Group.find(params[:id]) if params[:id]
  end

  def load_users
    @users = User.all.where.not(id: current_user)
  end

  def permitted_parameters
    params.require(:group).permit(:name)
  end
end
