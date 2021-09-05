class Admin::SearchesController < ApplicationController
  def index
    @search = params[:search]

    @users = User.search(params[:search])
    @shops = Shop.search(params[:search])
  end
end
