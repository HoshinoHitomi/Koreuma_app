class Public::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user.id)
  end

  def followings
    user = User.find_by(id: params[:user_id])
    if user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    else
      @users = user.followings
    end
  end

  def followers
    user = User.find_by(id: params[:user_id])
    if user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    else
      @users = user.followers
    end
  end
end
