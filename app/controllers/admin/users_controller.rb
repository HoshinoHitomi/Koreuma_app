class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to admin_users_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.email == 'guest@user'
      flash[:alert] = "このユーザーは編集できません。"
      redirect_to admin_user_path(@user)
    elsif @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to admin_users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました。"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :is_active
      )
  end
end
