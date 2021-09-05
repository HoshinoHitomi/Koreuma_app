class Public::SearchesController < ApplicationController
  def index
    @search = params[:search]

    @users = User.search(@search)
    @shops = Shop.search(@search)
    @foods = Food.search(@search)
  end
end
