class Admin::GenresController < Admin::ApplicationController
  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      Information.create!(
        title: "ジャンル追加のお知らせ",
        body: "新しく「#{@genre.name}」を追加しました。",
        )
        flash[:notice] = "ジャンルを作成しました。"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
    if @genre.nil?
      flash[:alert] = "ジャンルが見つかりませんでした。"
      redirect_to admin_genres_path
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを編集しました。"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
