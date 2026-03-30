class FollowsController < ApplicationController

  def create

    @follower_user = current_user
    @followed_user = User.find(params[:user_id])
    @follow = Follow.create(followed_user: @followed_user, follower_user: @follower_user)
    @follow.save
    redirect_to user_path(@followed_user), notice: "You are now following #{@followed_user}"

  end
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    @followed_user = User.find(params[:user_id])
    redirect_to user_path(@followed_user)
  end

end
