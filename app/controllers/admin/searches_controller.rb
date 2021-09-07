class Admin::SearchesController < Admin::ApplicationController
  def index
    @search = params[:search]

    @users = User.search(params[:search]).page(params[:page]).per(10)
    @shops = Shop.search(params[:search]).page(params[:page]).per(10)
  end
end
