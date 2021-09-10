class Public::UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    else
      @review = @user.reviews.last
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.email == 'guest@user'
      flash[:alert] = "ゲストユーザーは編集できません。"
      redirect_to user_path(@user)
    elsif @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    elsif @user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました。"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawl
    @user = User.find_by(id: current_user.id)
    if @user.email == 'guest@user'
      flash[:alert] = "ゲストユーザーは退会できません。"
      redirect_to user_path(@user)
    else
      @user.update(is_active: false)
      reset_session
      flash[:notice] = "退会しました。"
      redirect_to root_path
    end
  end

  private

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
