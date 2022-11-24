class StaticPagesController < ApplicationController
  def home
    @session_id = SecureRandom.urlsafe_base64
  end

  def top
    @users = User.where('session_id = ?', params[:session_id])
  end
end
