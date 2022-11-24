class UsersController < ApplicationController
  def index
    @users = User.where('session_id = ?', params[:session_id])
  end

  def new
    @user = User.new
    @groups = Group.where('session_id = ?', params[:session_id])
  end

  def create
    if User.create(user_params)
      flash[:success] = 'メンバーを登録しました'
      redirect_to users_path
    end
  end

  def destroy
  end

  private 
    def user_params 
      params.require(:user).permit(:name, :group_id, :session_id)
    end
end
