class GroupsController < ApplicationController
  def index
    @groups = Group.where('session_id = ?', params[:session_id])
    # @independent = User.where('group_id = ?', nil)
  end

  def new
    @group = Group.new()
  end

  def create
    group  = Group.new(group_params)
    if group.save
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
