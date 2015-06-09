class GroupsController < ApplicationController
  respond_to :html, :js

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.create(group_params) 
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params) 
    redirect_to groups_path
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_path(current_user)
  end

  private

  def group_params
     params.require(:group).permit(:name, :user_id, friend_ids: [])
  end
end
