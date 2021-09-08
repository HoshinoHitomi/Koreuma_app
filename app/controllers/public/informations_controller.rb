class Public::InformationsController < ApplicationController
  def index
    @informations = Information.page(params[:page]).per(10)
  end

  def show
    @information = Information.find_by(id: params[:id])
    if @information.nil?
      flash[:alert] = "お知らせが見つかりませんでした。"
      redirect_to informations_path
    end
  end
end
