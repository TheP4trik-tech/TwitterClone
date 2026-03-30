class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.following

  end
end
