class Public::RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
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
