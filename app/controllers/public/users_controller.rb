class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
  end

  def withdrawl
    @user = User.find_by(id: current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(
      :name,
      :profile_image,
      :introduction,
      :sweet_like,
      :salty_like,
      :bitter_like,
      :sour_like,
      :spicy_like
      )
  end
end
