# frozen_string_literal: true

class Shops::SessionsController < Devise::SessionsController
  before_action :reject_shop, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    shop = Shop.guest
    sign_in shop
    redirect_to shop_root_path
  end

  protected

  def reject_shop
    @shop = Shop.find_by(email: params[:shop][:email].downcase)
    if @shop
      if (@shop.valid_password?(params[:shop][:password]) && (@shop.active_for_authentication? == false))
        flash[:alert] = "退会済みです。"
        redirect_to new_shop_session_path
      end
    else
      flash[:alert] = "必要項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
