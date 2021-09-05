class Public::SearchesController < ApplicationController
  def index
    @search = params[:search]
    @genre_search = params[:genre_search]
    @taste_search = params[:taste_search]

    @shops = Shop.search(@search)
    @users = User.search(@search)

    if @genre_search.present?
      @foods = Food.where(genre_id: @genre_search)
    elsif @taste_search.present?
      @foods = Food.where(taste: @taste_search)
    else
      @foods = Food.search(@search)
    end
  end
end
