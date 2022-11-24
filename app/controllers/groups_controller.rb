class GroupsController < ApplicationController
  def index
    @groups = Group.where('session_id = ?', params[:session_id])
    @independent = User.where('group_id is NULL')
  end

  def new
    @group = Group.new()
  end

  def create
    if Group.create(group_params)
      flash[:success] = "グループを追加しました"
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
  end

  private
    def group_params
      params.require(:group).permit(:name, :session_id)
    end
end
